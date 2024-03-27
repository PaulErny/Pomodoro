//
//  TagsCollectionView.swift
//  Pomodoro
//
//  Created by Paul Erny on 20/03/2024.
//

import SwiftUI

struct TagsCollectionView<V: View>: View {
    
    var leadingView: V?
    var tags: [LabelModel]

    enum ViewDatas: Hashable {
        static func == (lhs: TagsCollectionView<V>.ViewDatas, rhs: TagsCollectionView<V>.ViewDatas) -> Bool {
            switch (lhs, rhs) {
            case (.tag(let l), .tag(let r)):
                return l.id == r.id
            case (.view, .view):
                return true
            default:
                return false
            }
        }
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .tag:
                hasher.combine(1)
            case .view:
                hasher.combine(2)
            }
        }
        
        case view(V)
        case tag(LabelModel)
    }
    
    @State private var datas: [ViewDatas] = []
    @State private var totalHeight
        = CGFloat.zero       // << variant for ScrollView/List
        //= CGFloat.infinity   // << variant for VStack

    init(tags: [LabelModel], @ViewBuilder _ leadingView: () -> V?) {
        self.leadingView = leadingView()
        self.tags = tags
        self.totalHeight = totalHeight
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
//        .frame(maxHeight: totalHeight) // << variant for VStack
        .onAppear {
            self.datas = {
                var result: [ViewDatas] = []
                
                if leadingView != nil {
                    result.append(ViewDatas.view(leadingView!))
                }
                
                tags.forEach {
                    result.append(ViewDatas.tag($0))
                }
                return result
            }()
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
//            if leadingView != nil {
//                leadingView
//                    .alignmentGuide(.leading, computeValue: { d in
//                        if (abs(width - d.width) > g.size.width)
//                        {
//                            width = 0
//                            height -= d.height
//                        }
//                        print(width)
//                        let result = width
//                        width -= d.width
//                        return result
//                    })
//                    .alignmentGuide(.top, computeValue: {d in
//                        let result = height
//                        return result
//                    })
//            }
            
            ForEach(datas, id: \.self) { data in
                switch data {
                case .view(let view):
                    view.padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if data == self.datas.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if data == self.datas.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                case .tag(let tag):
                    self.item(for: tag)
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if tag == self.tags.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if tag == self.tags.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                }
//                self.item(for: tag)
//                    .padding([.horizontal, .vertical], 4)
//                    .alignmentGuide(.leading, computeValue: { d in
//                        if (abs(width - d.width) > g.size.width)
//                        {
//                            width = 0
//                            height -= d.height
//                        }
//                        let result = width
//                        if tag == self.tags.last! {
//                            width = 0 //last item
//                        } else {
//                            width -= d.width
//                        }
//                        return result
//                    })
//                    .alignmentGuide(.top, computeValue: {d in
//                        let result = height
//                        if tag == self.tags.last! {
//                            height = 0 // last item
//                        }
//                        return result
//                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for tag: LabelModel) -> some View {
        Text(tag.name)
            .frame(height: 14)
            .padding([.leading, .trailing], 7)
            .padding([.bottom, .top], 3)
            .font(.body)// TODO: font
            .background(tag.color)
            .foregroundColor(Color.cardBackground)
            .cornerRadius(10)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

#Preview {
    TagsCollectionView(tags: [
        LabelModel(name: "prio 1", color: .red),
        LabelModel(name: "testLongLabel", color: .green),
        LabelModel(name: "avgLabel", color: .blue),
        LabelModel(name: "abc", color: .orange),
        LabelModel(name: "testLongLabel", color: .teal),
    ]) {
        Text("testttt")
    }
}
