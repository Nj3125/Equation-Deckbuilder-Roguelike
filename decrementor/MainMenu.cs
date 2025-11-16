using Godot;
using System;

public partial class MainMenu : Control
{
	public override void _Ready()
	{
		GetNode<Button>("Button Manager/Play").Pressed += OnPlayPressed;
		GetNode<Button>("Button Manager/Settings").Pressed += OnSettingsPressed;
		GetNode<Button>("Button Manager/Quit").Pressed += OnQuitPressed;
	}

	private void OnPlayPressed() 
	{
		GetTree().ChangeSceneToFile("res://Scenes/Level1.tscn");
	}
	private void OnSettingsPressed()
	{
		GetTree().ChangeSceneToFile("res://Scenes/Settings.tscn");
	}
	private void OnQuitPressed() 
	{
		GetTree().Quit();
	}
}
