using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ColorChange : MonoBehaviour {

	private Renderer _renderer;

	// Use this for initialization
	void Start () {
		_renderer = GetComponent<Renderer>();
	}
	
	// Update is called once per frame
	void Update () {	
		float timeValue = Time.time;	
		float colorValue = Mathf.Sin(timeValue) / 2.0f + 0.5f;

		_renderer.sharedMaterial.SetColor("_Color", new Color(0, colorValue, 0, 1));		
	}
}
