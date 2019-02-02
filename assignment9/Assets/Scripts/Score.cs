using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Text))]
public class Score : MonoBehaviour
{
	public static int score;
	private Text text;
    // Start is called before the first frame update
    void Start()
    {
		text = GetComponent<Text>();
    }

    // Update is called once per frame
    void Update()
    {
		if (text != null)
		{
			text.text = score.ToString();
		}
	}

	public void AddScore()
	{
		score++;
	}

	public void ResetScore()
	{
		score = 0;
	}
}
