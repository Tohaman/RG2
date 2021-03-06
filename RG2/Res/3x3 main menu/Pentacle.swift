//
//  Pentacle.swift
//  RG2
//
//  Created by Anton on 19.01.2019.
//  Copyright © 2019 RubicsGuide. All rights reserved.
//

import Foundation

struct Pentacle: Phases {
    func phase() -> String {
        let phase = "PENTACLE"
        return phase
    }
    
    func titles() -> [String] {
        return title
    }
    
    func images() -> [String] {
        return image
    }
    
    func descs() -> [String] {
        return description
    }
    
    func urls() -> [String] {
        return url
    }
    
    func comments() -> [String] {
        return []
    }
    
    let title = [
        st1_title,
        st2_title,
        st3_title,
        st4_title
    ]
    
    let image = [
        "pentacle_1",
        "pentacle_2",
        "pentacle_3",
        "pentacle_4"
    ]
    
    let url = [
        st1_url,
        st2_url,
        st3_url,
        st4_url
    ]
    
    
    let description = [
        st1_description,
        st2_description,
        st3_description,
        st4_description
    ]
    
    
    static let st1_title = "1. Особенности головоломки"
    static let st1_description = """
    <p><a href="rg2://ytplay?time=0:25&link=6GMCv19sIS4">Пентакль куб</a> — это головоломка, которая выглядит немного пугающе и не только из-за значка пентаграммы, кажется, что собрать эту головоломку очень сложно. На первый взгляд, ближайший «родственник» этой головоломки – мегаминкс, но на самом деле эта головоломка получилась путем скрещивания кубика 2х2 и кубика 5х5, т.е. если вы их уже умеете собирать, то для вас вполне будет достаточно информации, что сначала надо собрать углы как в кубике 2х2, а потом центры, как в 5х5, и вы сможете собрать эту головоломку без моих подсказок. Надеюсь, не надо объяснять, что если вы умеете собирать 3х3, то значит, умеете собирать и 2х2, ведь двушка, это трешка, без ребер, а вот с кубиком 5х5 уже все не так просто, но обо всем по порядку.</p>

    <p>Если вы еще не умеете собирать кубик 3х3, то пожалуйста сначала научитесь собирать его, причем очень желательно чтобы вы это умели делать по моей методике или методике Максима Чечнева, которые вы можете найти в этой программе, т.к. далее будут использоваться мнемонические обозначения вращений, применяемые в этих методиках. Кому-то они могут показаться дурацкими, но поверьте, что очень помогают не сбиться при выполнении длинных алгоритмов, что особенно актуально для головоломок, которые неудобно крутить, т.е. таких как эта.</p>

    <p>Начнем со <a href="rg2://ytplay?time=2:17&link=6GMCv19sIS4">строения головоломки.</a> Основными частями являются углы (8 трехцветных элементов)</p>

    <p style="text-align:center"><img src="pentacle_1_1.xml" width="20%%"></p>

    <p>И центры, которые в свою очередь состоят из <a href="rg2://ytplay?time=2:37&link=6GMCv19sIS4">11 одноцветных элементов</a></p>

    <p style="text-align:center"><img src="pentacle_1_2.xml" width="20%%"></p>

    <p>Центрального элемента (центр центра)</p>

    <p style="text-align:center"><img src="pentacle_1_3.xml" width="20%%"></p>

    <p>Лучевых элементов (5 штук)</p>

    <p style="text-align:center"><img src="pentacle_1_4.xml" width="20%%"></p>

    <p>Икс элементов (5 штук)</p>

    <p style="text-align:center"><img src="pentacle_1_5.xml" width="20%%"></p>

    <p><a href="rg2://ytplay?time=3:09&link=6GMCv19sIS4">Основная сложность головоломки</a> на
    самом деле в дополнительных вращениях центров для того,
    чтобы повернуть ту или иную грань. Например, чтобы повернуть верхнюю грань, необходимо сначала
    развернуть центры вот так</p>

    <p style="text-align:center"><img src="pentacle_1_6.xml" width="20%%"></p>

    <p>А чтобы повернуть правую, нужно уже вот так:</p>

    <p style="text-align:center"><img src="pentacle_1_7.xml" width="20%%"></p>

    <p>Очень желательно, хорошо смазать эту головоломку, чтобы можно было немного не доворачивать
    центры, что очень сильно упрощает сборку.</p>

    <p>Ну и чтобы собирать эту головоломку, нам потребуются формулы, а чтобы записать формулы, давайте
    придумаем <a href="rg2://ytplay?time=4:12&link=6GMCv19sIS4">язык вращений.</a></p>

    <p>Вращения граней будем обозначать большими буквами, как и в обычном кубике.
    <a href="rg2://ytplay?time=4:37&link=6GMCv19sIS4">Например, U.</a></p>

    <p style="text-align:center"><img src="pentacle_1_8.xml" width="30%%"></p>

    <p>А вот вращение соответствующего центра маленькими.
    <a href="rg2://ytplay?time=5:27&link=6GMCv19sIS4">Например, u.</a></p>

    <p style="text-align:center"><img src="pentacle_1_9.xml" width="30%%"></p>

    <p>Заметьте, что выравнивающие движения центров, для того чтобы повернуть какую-то грань, мы никак не будем обозначать.</p>

    <p>Например, вот как будет выглядеть вот такой алгоритм:
    <a href="rg2://ytplay?time=7:36&link=6GMCv19sIS4"><b>R U R’ U’</b></a>, а вот так
    <a href="rg2://ytplay?time=8:21&link=6GMCv19sIS4"><b>R u R’ u’</b></a></p>

    <p><a href="rg2://ytplay?time=8:31&link=6GMCv19sIS4">Перейдем к сборке.</a>
    Первым делом нужно поставить на свои места все углы. Т.е. представим, что
    это у нас кубик 2х2 и на центры пока не обращаем никакого внимания. Если вы знаете
    <a href="rg2://ytplay?time=9:46&link=6GMCv19sIS4">метод Ортега</a>
    для двушки, то можете использовать его алгоритмы, что очень актуально для этой головоломки, т.к.
    позволяет очень сильно сократить количество ходов, необходимых для сборки углов. Но поскольку с
    этой методикой знакомы далеко не все, далее будем использовать простые алгоритмы, т.е., например,
    для этого этапа это будут пиф-пафы.</p>

    <p><a href="rg2://ytplay?time=10:36&link=6GMCv19sIS4">Как и в обычном кубике 3х3,</a>
    сначала находим белый центр. Если рядом с белым центром
    <a href="rg2://ytplay?time=10:45&link=6GMCv19sIS4">уже есть какой-то белый уголок,</a>
    то лучше сначала совместить центры с этим уголком, <a href="rg2://ytplay?time=11:06&link=6GMCv19sIS4">а если нет,</a>
    то можно сразу поворнуть головоломку этим белым центром вниз.</p>
    <p>Теперь находим какой-то белый уголок на верхней грани, подгоняем к своим центрам и
    делаем пиф-пафы до тех пор, пока уголок не встанет на свое место. Т.е. делаем один, три или пять
    пиф-пафов в зависимости от того, куда смотрит белая наклейка вбок, вверх или прямо на нас. Более
    подробно это рассказано в 4-ом этапе методики 3х3 для начинающих от Максима Чечнева или во 2-ом
    этапе моей методики.<p>

    <p>Естественно, что вы можете использовать
    <a href="rg2://ytplay?time=15:56&link=6GMCv19sIS4">любые известные вам алгоритмы</a> от 2х2 или 3х3, например,
    английский пиф-паф или анти-пиф-паф, для того чтобы уменьшить ходов, для установки элемента на свое место.</p>

    <p>Повторяем для всех белых уголков, до тех пор пока все они не встанут на свои места. И переходим к
    оставшимся четырем желтым уголкам.</p>
    """
    static let st1_url = ""
    
    static let st2_title = "2"
    static let st2_description = """
    """
    static let st2_url = ""
    
    static let st3_title = "3"
    static let st3_description = """
    """
    static let st3_url = ""
    
    static let st4_title = "4"
    static let st4_description = """
    """
    static let st4_url = ""
    
}
