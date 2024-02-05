using TMPro;

using UnityExplorer.UI.Widgets.AutoComplete;
using UniverseLib.UI;
using UniverseLib.UI.Models;
using UniverseLib.UI.ObjectPool;

namespace UnityExplorer.UI.Widgets
{
    public abstract class BaseArgumentHandler : IPooledObject
    {
        internal TMP_Text argNameLabel;
        internal TMPInputFieldRef inputField;
        internal TypeCompleter typeCompleter;

        // IPooledObject
        public float DefaultHeight => 25f;
        public GameObject UIRoot { get; set; }

        public abstract void CreateSpecialContent();

        public GameObject CreateContent(GameObject parent)
        {
            UIRoot = UIFactory.CreateUIObject("ArgRow", parent);
            UIFactory.SetLayoutElement(UIRoot, minHeight: 25, flexibleHeight: 50, minWidth: 50, flexibleWidth: 9999);
            UIFactory.SetLayoutGroup<HorizontalLayoutGroup>(UIRoot, false, false, true, true, 5);
            UIRoot.AddComponent<ContentSizeFitter>().verticalFit = ContentSizeFitter.FitMode.PreferredSize;

            argNameLabel = UIFactory.CreateTMPLabel(UIRoot, "ArgLabel", "not set", TextAlignmentOptions.Left);
            UIFactory.SetLayoutElement(argNameLabel.gameObject, minWidth: 40, flexibleWidth: 90, minHeight: 25, flexibleHeight: 50);
            argNameLabel.textWrappingMode = TextWrappingModes.Normal;

            inputField = UIFactory.CreateTMPInputField(UIRoot, "InputField", "...");
            UIFactory.SetLayoutElement(inputField.UIRoot, minHeight: 25, flexibleHeight: 50, minWidth: 100, flexibleWidth: 1000);
            inputField.Component.lineType = TMP_InputField.LineType.MultiLineNewline;
            inputField.UIRoot.AddComponent<ContentSizeFitter>().verticalFit = ContentSizeFitter.FitMode.PreferredSize;

            typeCompleter = new TypeCompleter(typeof(object), this.inputField)
            {
                Enabled = false
            };

            CreateSpecialContent();

            return UIRoot;
        }
    }
}
