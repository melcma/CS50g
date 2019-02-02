using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour
{
	public Component ambientSound;
	public Score score;

	// Start is called before the first frame update
	void Start()
    {
	}

	// Update is called once per frame
	void Update()
    {
		if (transform.position.y < -10)
		{
			if (ambientSound.gameObject != null)
			{
				Destroy(ambientSound.gameObject);
			}
			score.ResetScore();
			SceneManager.LoadScene("GameOver");
		}
    }
}
