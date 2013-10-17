//
//  KwNViewController.m
//  SandBox
//
//  Created by Andres Kwan on 10/17/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KwNViewController.h"

@interface KwNViewController ()

@end

@implementation KwNViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    
    // Obtener ruta a la carpeta de cache de la sandbox
    // existen dos formas
    // NSFileManager
    // or
    // Function
    NSFileManager * fileManager = [NSFileManager defaultManager];
    // dame la ruta de la aplicacion
    NSURL *url = [[fileManager URLsForDirectory:NSCachesDirectory
                                      inDomains:NSUserDomainMask]
                  lastObject];
    
    url = [url URLByAppendingPathComponent:@"text.txt"];
    
    // Guardamos algo dentro del archivo
    
    NSError * error = nil;
    BOOL rc = NO;
    
    rc = [@"Hola persistencia" writeToURL:url
                               atomically:YES
                                 encoding:NSUTF8StringEncoding
                                    error:&error];
    
    if(rc == NO)
    {
        // Ha Habido un error
        NSLog(@"Error al guardar: %@", error);
    }
    
    // leer para asegurarnos de que ha salido bien
    // devuelve un objeto no un booleano para indicar error
    NSString * result = [NSString stringWithContentsOfURL:url
                                                 encoding:NSUTF8StringEncoding
                                                    error:&error];
    
    if (result == nil) {
        // Error
        NSLog(@"Error al leer: %@", error);
        
        
    }
}
@end
