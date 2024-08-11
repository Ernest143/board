
board.elf:     file format elf32-littlearm


Disassembly of section .text:

080001e4 <__do_global_dtors_aux>:
 80001e4:	b510      	push	{r4, lr}
 80001e6:	4c05      	ldr	r4, [pc, #20]	; (80001fc <__do_global_dtors_aux+0x18>)
 80001e8:	7823      	ldrb	r3, [r4, #0]
 80001ea:	b933      	cbnz	r3, 80001fa <__do_global_dtors_aux+0x16>
 80001ec:	4b04      	ldr	r3, [pc, #16]	; (8000200 <__do_global_dtors_aux+0x1c>)
 80001ee:	b113      	cbz	r3, 80001f6 <__do_global_dtors_aux+0x12>
 80001f0:	4804      	ldr	r0, [pc, #16]	; (8000204 <__do_global_dtors_aux+0x20>)
 80001f2:	f3af 8000 	nop.w
 80001f6:	2301      	movs	r3, #1
 80001f8:	7023      	strb	r3, [r4, #0]
 80001fa:	bd10      	pop	{r4, pc}
 80001fc:	20000078 	.word	0x20000078
 8000200:	00000000 	.word	0x00000000
 8000204:	080045bc 	.word	0x080045bc

08000208 <frame_dummy>:
 8000208:	b508      	push	{r3, lr}
 800020a:	4b03      	ldr	r3, [pc, #12]	; (8000218 <frame_dummy+0x10>)
 800020c:	b11b      	cbz	r3, 8000216 <frame_dummy+0xe>
 800020e:	4903      	ldr	r1, [pc, #12]	; (800021c <frame_dummy+0x14>)
 8000210:	4803      	ldr	r0, [pc, #12]	; (8000220 <frame_dummy+0x18>)
 8000212:	f3af 8000 	nop.w
 8000216:	bd08      	pop	{r3, pc}
 8000218:	00000000 	.word	0x00000000
 800021c:	2000007c 	.word	0x2000007c
 8000220:	080045bc 	.word	0x080045bc

08000224 <__libc_init_array>:
 8000224:	b570      	push	{r4, r5, r6, lr}
 8000226:	2600      	movs	r6, #0
 8000228:	4d0c      	ldr	r5, [pc, #48]	; (800025c <__libc_init_array+0x38>)
 800022a:	4c0d      	ldr	r4, [pc, #52]	; (8000260 <__libc_init_array+0x3c>)
 800022c:	1b64      	subs	r4, r4, r5
 800022e:	10a4      	asrs	r4, r4, #2
 8000230:	42a6      	cmp	r6, r4
 8000232:	d109      	bne.n	8000248 <__libc_init_array+0x24>
 8000234:	f004 f9c2 	bl	80045bc <_init>
 8000238:	2600      	movs	r6, #0
 800023a:	4d0a      	ldr	r5, [pc, #40]	; (8000264 <__libc_init_array+0x40>)
 800023c:	4c0a      	ldr	r4, [pc, #40]	; (8000268 <__libc_init_array+0x44>)
 800023e:	1b64      	subs	r4, r4, r5
 8000240:	10a4      	asrs	r4, r4, #2
 8000242:	42a6      	cmp	r6, r4
 8000244:	d105      	bne.n	8000252 <__libc_init_array+0x2e>
 8000246:	bd70      	pop	{r4, r5, r6, pc}
 8000248:	f855 3b04 	ldr.w	r3, [r5], #4
 800024c:	4798      	blx	r3
 800024e:	3601      	adds	r6, #1
 8000250:	e7ee      	b.n	8000230 <__libc_init_array+0xc>
 8000252:	f855 3b04 	ldr.w	r3, [r5], #4
 8000256:	4798      	blx	r3
 8000258:	3601      	adds	r6, #1
 800025a:	e7f2      	b.n	8000242 <__libc_init_array+0x1e>
 800025c:	08004904 	.word	0x08004904
 8000260:	08004904 	.word	0x08004904
 8000264:	08004904 	.word	0x08004904
 8000268:	08004908 	.word	0x08004908

0800026c <memset>:
 800026c:	4603      	mov	r3, r0
 800026e:	4402      	add	r2, r0
 8000270:	4293      	cmp	r3, r2
 8000272:	d100      	bne.n	8000276 <memset+0xa>
 8000274:	4770      	bx	lr
 8000276:	f803 1b01 	strb.w	r1, [r3], #1
 800027a:	e7f9      	b.n	8000270 <memset+0x4>

0800027c <main>:
 800027c:	b580      	push	{r7, lr}
 800027e:	b086      	sub	sp, #24
 8000280:	af00      	add	r7, sp, #0
 8000282:	2300      	movs	r3, #0
 8000284:	75fb      	strb	r3, [r7, #23]
 8000286:	f002 fd4f 	bl	8002d28 <board_init>
 800028a:	f002 feeb 	bl	8003064 <usart_recive_data_length>
 800028e:	6138      	str	r0, [r7, #16]
 8000290:	7dfb      	ldrb	r3, [r7, #23]
 8000292:	3301      	adds	r3, #1
 8000294:	75fb      	strb	r3, [r7, #23]
 8000296:	2064      	movs	r0, #100	; 0x64
 8000298:	f000 f974 	bl	8000584 <HAL_Delay>
 800029c:	7dfb      	ldrb	r3, [r7, #23]
 800029e:	2b03      	cmp	r3, #3
 80002a0:	d105      	bne.n	80002ae <main+0x32>
 80002a2:	2120      	movs	r1, #32
 80002a4:	4824      	ldr	r0, [pc, #144]	; (8000338 <main+0xbc>)
 80002a6:	f001 f82e 	bl	8001306 <HAL_GPIO_TogglePin>
 80002aa:	2300      	movs	r3, #0
 80002ac:	75fb      	strb	r3, [r7, #23]
 80002ae:	463b      	mov	r3, r7
 80002b0:	2208      	movs	r2, #8
 80002b2:	4619      	mov	r1, r3
 80002b4:	4821      	ldr	r0, [pc, #132]	; (800033c <main+0xc0>)
 80002b6:	f002 fb71 	bl	800299c <board_flash_read>
 80002ba:	463b      	mov	r3, r7
 80002bc:	2206      	movs	r2, #6
 80002be:	4920      	ldr	r1, [pc, #128]	; (8000340 <main+0xc4>)
 80002c0:	4618      	mov	r0, r3
 80002c2:	f003 f807 	bl	80032d4 <strncmp>
 80002c6:	4603      	mov	r3, r0
 80002c8:	2b00      	cmp	r3, #0
 80002ca:	d003      	beq.n	80002d4 <main+0x58>
 80002cc:	4b1d      	ldr	r3, [pc, #116]	; (8000344 <main+0xc8>)
 80002ce:	681b      	ldr	r3, [r3, #0]
 80002d0:	2b14      	cmp	r3, #20
 80002d2:	d928      	bls.n	8000326 <main+0xaa>
 80002d4:	2000      	movs	r0, #0
 80002d6:	f002 fdc3 	bl	8002e60 <key_scan>
 80002da:	4603      	mov	r3, r0
 80002dc:	73fb      	strb	r3, [r7, #15]
 80002de:	7bfb      	ldrb	r3, [r7, #15]
 80002e0:	2b03      	cmp	r3, #3
 80002e2:	d127      	bne.n	8000334 <main+0xb8>
 80002e4:	693b      	ldr	r3, [r7, #16]
 80002e6:	2b00      	cmp	r3, #0
 80002e8:	d019      	beq.n	800031e <main+0xa2>
 80002ea:	4817      	ldr	r0, [pc, #92]	; (8000348 <main+0xcc>)
 80002ec:	f002 ffca 	bl	8003284 <puts>
 80002f0:	4816      	ldr	r0, [pc, #88]	; (800034c <main+0xd0>)
 80002f2:	f002 fb63 	bl	80029bc <board_flash_flush>
 80002f6:	60b8      	str	r0, [r7, #8]
 80002f8:	68bb      	ldr	r3, [r7, #8]
 80002fa:	2b00      	cmp	r3, #0
 80002fc:	d004      	beq.n	8000308 <main+0x8c>
 80002fe:	68b9      	ldr	r1, [r7, #8]
 8000300:	4813      	ldr	r0, [pc, #76]	; (8000350 <main+0xd4>)
 8000302:	f002 ff39 	bl	8003178 <iprintf>
 8000306:	e015      	b.n	8000334 <main+0xb8>
 8000308:	4812      	ldr	r0, [pc, #72]	; (8000354 <main+0xd8>)
 800030a:	f002 ffbb 	bl	8003284 <puts>
 800030e:	2208      	movs	r2, #8
 8000310:	4911      	ldr	r1, [pc, #68]	; (8000358 <main+0xdc>)
 8000312:	480a      	ldr	r0, [pc, #40]	; (800033c <main+0xc0>)
 8000314:	f002 fc12 	bl	8002b3c <board_flash_write>
 8000318:	f002 fd16 	bl	8002d48 <board_app_jump>
 800031c:	e00a      	b.n	8000334 <main+0xb8>
 800031e:	480f      	ldr	r0, [pc, #60]	; (800035c <main+0xe0>)
 8000320:	f002 ffb0 	bl	8003284 <puts>
 8000324:	e006      	b.n	8000334 <main+0xb8>
 8000326:	f002 fd0f 	bl	8002d48 <board_app_jump>
 800032a:	4b06      	ldr	r3, [pc, #24]	; (8000344 <main+0xc8>)
 800032c:	681b      	ldr	r3, [r3, #0]
 800032e:	3301      	adds	r3, #1
 8000330:	4a04      	ldr	r2, [pc, #16]	; (8000344 <main+0xc8>)
 8000332:	6013      	str	r3, [r2, #0]
 8000334:	e7a9      	b.n	800028a <main+0xe>
 8000336:	bf00      	nop
 8000338:	40010c00 	.word	0x40010c00
 800033c:	0807fff8 	.word	0x0807fff8
 8000340:	080045d4 	.word	0x080045d4
 8000344:	20000094 	.word	0x20000094
 8000348:	080045dc 	.word	0x080045dc
 800034c:	08010000 	.word	0x08010000
 8000350:	080045f8 	.word	0x080045f8
 8000354:	08004614 	.word	0x08004614
 8000358:	08004630 	.word	0x08004630
 800035c:	08004638 	.word	0x08004638

08000360 <Reset_Handler>:
 8000360:	f000 f823 	bl	80003aa <SystemInit>
 8000364:	480b      	ldr	r0, [pc, #44]	; (8000394 <LoopFillZerobss+0xe>)
 8000366:	490c      	ldr	r1, [pc, #48]	; (8000398 <LoopFillZerobss+0x12>)
 8000368:	4a0c      	ldr	r2, [pc, #48]	; (800039c <LoopFillZerobss+0x16>)
 800036a:	2300      	movs	r3, #0
 800036c:	e002      	b.n	8000374 <LoopCopyDataInit>

0800036e <CopyDataInit>:
 800036e:	58d4      	ldr	r4, [r2, r3]
 8000370:	50c4      	str	r4, [r0, r3]
 8000372:	3304      	adds	r3, #4

08000374 <LoopCopyDataInit>:
 8000374:	18c4      	adds	r4, r0, r3
 8000376:	428c      	cmp	r4, r1
 8000378:	d3f9      	bcc.n	800036e <CopyDataInit>
 800037a:	4a09      	ldr	r2, [pc, #36]	; (80003a0 <LoopFillZerobss+0x1a>)
 800037c:	4c09      	ldr	r4, [pc, #36]	; (80003a4 <LoopFillZerobss+0x1e>)
 800037e:	2300      	movs	r3, #0
 8000380:	e001      	b.n	8000386 <LoopFillZerobss>

08000382 <FillZerobss>:
 8000382:	6013      	str	r3, [r2, #0]
 8000384:	3204      	adds	r2, #4

08000386 <LoopFillZerobss>:
 8000386:	42a2      	cmp	r2, r4
 8000388:	d3fb      	bcc.n	8000382 <FillZerobss>
 800038a:	f7ff ff4b 	bl	8000224 <__libc_init_array>
 800038e:	f7ff ff75 	bl	800027c <main>
 8000392:	4770      	bx	lr
 8000394:	20000000 	.word	0x20000000
 8000398:	20000078 	.word	0x20000078
 800039c:	0800490c 	.word	0x0800490c
 80003a0:	20000078 	.word	0x20000078
 80003a4:	2000de28 	.word	0x2000de28

080003a8 <ADC1_2_IRQHandler>:
 80003a8:	e7fe      	b.n	80003a8 <ADC1_2_IRQHandler>

080003aa <SystemInit>:
 80003aa:	b480      	push	{r7}
 80003ac:	af00      	add	r7, sp, #0
 80003ae:	bf00      	nop
 80003b0:	46bd      	mov	sp, r7
 80003b2:	bc80      	pop	{r7}
 80003b4:	4770      	bx	lr
	...

080003b8 <SystemCoreClockUpdate>:
 80003b8:	b480      	push	{r7}
 80003ba:	b085      	sub	sp, #20
 80003bc:	af00      	add	r7, sp, #0
 80003be:	2300      	movs	r3, #0
 80003c0:	60fb      	str	r3, [r7, #12]
 80003c2:	2300      	movs	r3, #0
 80003c4:	60bb      	str	r3, [r7, #8]
 80003c6:	2300      	movs	r3, #0
 80003c8:	607b      	str	r3, [r7, #4]
 80003ca:	4b2f      	ldr	r3, [pc, #188]	; (8000488 <SystemCoreClockUpdate+0xd0>)
 80003cc:	685b      	ldr	r3, [r3, #4]
 80003ce:	f003 030c 	and.w	r3, r3, #12
 80003d2:	60fb      	str	r3, [r7, #12]
 80003d4:	68fb      	ldr	r3, [r7, #12]
 80003d6:	2b08      	cmp	r3, #8
 80003d8:	d011      	beq.n	80003fe <SystemCoreClockUpdate+0x46>
 80003da:	68fb      	ldr	r3, [r7, #12]
 80003dc:	2b08      	cmp	r3, #8
 80003de:	d83a      	bhi.n	8000456 <SystemCoreClockUpdate+0x9e>
 80003e0:	68fb      	ldr	r3, [r7, #12]
 80003e2:	2b00      	cmp	r3, #0
 80003e4:	d003      	beq.n	80003ee <SystemCoreClockUpdate+0x36>
 80003e6:	68fb      	ldr	r3, [r7, #12]
 80003e8:	2b04      	cmp	r3, #4
 80003ea:	d004      	beq.n	80003f6 <SystemCoreClockUpdate+0x3e>
 80003ec:	e033      	b.n	8000456 <SystemCoreClockUpdate+0x9e>
 80003ee:	4b27      	ldr	r3, [pc, #156]	; (800048c <SystemCoreClockUpdate+0xd4>)
 80003f0:	4a27      	ldr	r2, [pc, #156]	; (8000490 <SystemCoreClockUpdate+0xd8>)
 80003f2:	601a      	str	r2, [r3, #0]
 80003f4:	e033      	b.n	800045e <SystemCoreClockUpdate+0xa6>
 80003f6:	4b25      	ldr	r3, [pc, #148]	; (800048c <SystemCoreClockUpdate+0xd4>)
 80003f8:	4a25      	ldr	r2, [pc, #148]	; (8000490 <SystemCoreClockUpdate+0xd8>)
 80003fa:	601a      	str	r2, [r3, #0]
 80003fc:	e02f      	b.n	800045e <SystemCoreClockUpdate+0xa6>
 80003fe:	4b22      	ldr	r3, [pc, #136]	; (8000488 <SystemCoreClockUpdate+0xd0>)
 8000400:	685b      	ldr	r3, [r3, #4]
 8000402:	f403 1370 	and.w	r3, r3, #3932160	; 0x3c0000
 8000406:	60bb      	str	r3, [r7, #8]
 8000408:	4b1f      	ldr	r3, [pc, #124]	; (8000488 <SystemCoreClockUpdate+0xd0>)
 800040a:	685b      	ldr	r3, [r3, #4]
 800040c:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 8000410:	607b      	str	r3, [r7, #4]
 8000412:	68bb      	ldr	r3, [r7, #8]
 8000414:	0c9b      	lsrs	r3, r3, #18
 8000416:	3302      	adds	r3, #2
 8000418:	60bb      	str	r3, [r7, #8]
 800041a:	687b      	ldr	r3, [r7, #4]
 800041c:	2b00      	cmp	r3, #0
 800041e:	d106      	bne.n	800042e <SystemCoreClockUpdate+0x76>
 8000420:	68bb      	ldr	r3, [r7, #8]
 8000422:	4a1c      	ldr	r2, [pc, #112]	; (8000494 <SystemCoreClockUpdate+0xdc>)
 8000424:	fb02 f303 	mul.w	r3, r2, r3
 8000428:	4a18      	ldr	r2, [pc, #96]	; (800048c <SystemCoreClockUpdate+0xd4>)
 800042a:	6013      	str	r3, [r2, #0]
 800042c:	e017      	b.n	800045e <SystemCoreClockUpdate+0xa6>
 800042e:	4b16      	ldr	r3, [pc, #88]	; (8000488 <SystemCoreClockUpdate+0xd0>)
 8000430:	685b      	ldr	r3, [r3, #4]
 8000432:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 8000436:	2b00      	cmp	r3, #0
 8000438:	d006      	beq.n	8000448 <SystemCoreClockUpdate+0x90>
 800043a:	68bb      	ldr	r3, [r7, #8]
 800043c:	4a15      	ldr	r2, [pc, #84]	; (8000494 <SystemCoreClockUpdate+0xdc>)
 800043e:	fb02 f303 	mul.w	r3, r2, r3
 8000442:	4a12      	ldr	r2, [pc, #72]	; (800048c <SystemCoreClockUpdate+0xd4>)
 8000444:	6013      	str	r3, [r2, #0]
 8000446:	e00a      	b.n	800045e <SystemCoreClockUpdate+0xa6>
 8000448:	68bb      	ldr	r3, [r7, #8]
 800044a:	4a11      	ldr	r2, [pc, #68]	; (8000490 <SystemCoreClockUpdate+0xd8>)
 800044c:	fb02 f303 	mul.w	r3, r2, r3
 8000450:	4a0e      	ldr	r2, [pc, #56]	; (800048c <SystemCoreClockUpdate+0xd4>)
 8000452:	6013      	str	r3, [r2, #0]
 8000454:	e003      	b.n	800045e <SystemCoreClockUpdate+0xa6>
 8000456:	4b0d      	ldr	r3, [pc, #52]	; (800048c <SystemCoreClockUpdate+0xd4>)
 8000458:	4a0d      	ldr	r2, [pc, #52]	; (8000490 <SystemCoreClockUpdate+0xd8>)
 800045a:	601a      	str	r2, [r3, #0]
 800045c:	bf00      	nop
 800045e:	4b0a      	ldr	r3, [pc, #40]	; (8000488 <SystemCoreClockUpdate+0xd0>)
 8000460:	685b      	ldr	r3, [r3, #4]
 8000462:	091b      	lsrs	r3, r3, #4
 8000464:	f003 030f 	and.w	r3, r3, #15
 8000468:	4a0b      	ldr	r2, [pc, #44]	; (8000498 <SystemCoreClockUpdate+0xe0>)
 800046a:	5cd3      	ldrb	r3, [r2, r3]
 800046c:	60fb      	str	r3, [r7, #12]
 800046e:	4b07      	ldr	r3, [pc, #28]	; (800048c <SystemCoreClockUpdate+0xd4>)
 8000470:	681a      	ldr	r2, [r3, #0]
 8000472:	68fb      	ldr	r3, [r7, #12]
 8000474:	fa22 f303 	lsr.w	r3, r2, r3
 8000478:	4a04      	ldr	r2, [pc, #16]	; (800048c <SystemCoreClockUpdate+0xd4>)
 800047a:	6013      	str	r3, [r2, #0]
 800047c:	bf00      	nop
 800047e:	3714      	adds	r7, #20
 8000480:	46bd      	mov	sp, r7
 8000482:	bc80      	pop	{r7}
 8000484:	4770      	bx	lr
 8000486:	bf00      	nop
 8000488:	40021000 	.word	0x40021000
 800048c:	20000064 	.word	0x20000064
 8000490:	007a1200 	.word	0x007a1200
 8000494:	003d0900 	.word	0x003d0900
 8000498:	08004844 	.word	0x08004844

0800049c <HAL_Init>:
 800049c:	b580      	push	{r7, lr}
 800049e:	af00      	add	r7, sp, #0
 80004a0:	4b08      	ldr	r3, [pc, #32]	; (80004c4 <HAL_Init+0x28>)
 80004a2:	681b      	ldr	r3, [r3, #0]
 80004a4:	4a07      	ldr	r2, [pc, #28]	; (80004c4 <HAL_Init+0x28>)
 80004a6:	f043 0310 	orr.w	r3, r3, #16
 80004aa:	6013      	str	r3, [r2, #0]
 80004ac:	2003      	movs	r0, #3
 80004ae:	f000 f93d 	bl	800072c <HAL_NVIC_SetPriorityGrouping>
 80004b2:	200f      	movs	r0, #15
 80004b4:	f000 f82c 	bl	8000510 <HAL_InitTick>
 80004b8:	f000 f81e 	bl	80004f8 <HAL_MspInit>
 80004bc:	2300      	movs	r3, #0
 80004be:	4618      	mov	r0, r3
 80004c0:	bd80      	pop	{r7, pc}
 80004c2:	bf00      	nop
 80004c4:	40022000 	.word	0x40022000

080004c8 <HAL_DeInit>:
 80004c8:	b580      	push	{r7, lr}
 80004ca:	af00      	add	r7, sp, #0
 80004cc:	4b09      	ldr	r3, [pc, #36]	; (80004f4 <HAL_DeInit+0x2c>)
 80004ce:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 80004d2:	611a      	str	r2, [r3, #16]
 80004d4:	4b07      	ldr	r3, [pc, #28]	; (80004f4 <HAL_DeInit+0x2c>)
 80004d6:	2200      	movs	r2, #0
 80004d8:	611a      	str	r2, [r3, #16]
 80004da:	4b06      	ldr	r3, [pc, #24]	; (80004f4 <HAL_DeInit+0x2c>)
 80004dc:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 80004e0:	60da      	str	r2, [r3, #12]
 80004e2:	4b04      	ldr	r3, [pc, #16]	; (80004f4 <HAL_DeInit+0x2c>)
 80004e4:	2200      	movs	r2, #0
 80004e6:	60da      	str	r2, [r3, #12]
 80004e8:	f000 f80c 	bl	8000504 <HAL_MspDeInit>
 80004ec:	2300      	movs	r3, #0
 80004ee:	4618      	mov	r0, r3
 80004f0:	bd80      	pop	{r7, pc}
 80004f2:	bf00      	nop
 80004f4:	40021000 	.word	0x40021000

080004f8 <HAL_MspInit>:
 80004f8:	b480      	push	{r7}
 80004fa:	af00      	add	r7, sp, #0
 80004fc:	bf00      	nop
 80004fe:	46bd      	mov	sp, r7
 8000500:	bc80      	pop	{r7}
 8000502:	4770      	bx	lr

08000504 <HAL_MspDeInit>:
 8000504:	b480      	push	{r7}
 8000506:	af00      	add	r7, sp, #0
 8000508:	bf00      	nop
 800050a:	46bd      	mov	sp, r7
 800050c:	bc80      	pop	{r7}
 800050e:	4770      	bx	lr

08000510 <HAL_InitTick>:
 8000510:	b580      	push	{r7, lr}
 8000512:	b082      	sub	sp, #8
 8000514:	af00      	add	r7, sp, #0
 8000516:	6078      	str	r0, [r7, #4]
 8000518:	4b12      	ldr	r3, [pc, #72]	; (8000564 <HAL_InitTick+0x54>)
 800051a:	681a      	ldr	r2, [r3, #0]
 800051c:	4b12      	ldr	r3, [pc, #72]	; (8000568 <HAL_InitTick+0x58>)
 800051e:	781b      	ldrb	r3, [r3, #0]
 8000520:	4619      	mov	r1, r3
 8000522:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 8000526:	fbb3 f3f1 	udiv	r3, r3, r1
 800052a:	fbb2 f3f3 	udiv	r3, r2, r3
 800052e:	4618      	mov	r0, r3
 8000530:	f000 f923 	bl	800077a <HAL_SYSTICK_Config>
 8000534:	4603      	mov	r3, r0
 8000536:	2b00      	cmp	r3, #0
 8000538:	d001      	beq.n	800053e <HAL_InitTick+0x2e>
 800053a:	2301      	movs	r3, #1
 800053c:	e00e      	b.n	800055c <HAL_InitTick+0x4c>
 800053e:	687b      	ldr	r3, [r7, #4]
 8000540:	2b0f      	cmp	r3, #15
 8000542:	d80a      	bhi.n	800055a <HAL_InitTick+0x4a>
 8000544:	2200      	movs	r2, #0
 8000546:	6879      	ldr	r1, [r7, #4]
 8000548:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800054c:	f000 f8f9 	bl	8000742 <HAL_NVIC_SetPriority>
 8000550:	4a06      	ldr	r2, [pc, #24]	; (800056c <HAL_InitTick+0x5c>)
 8000552:	687b      	ldr	r3, [r7, #4]
 8000554:	6013      	str	r3, [r2, #0]
 8000556:	2300      	movs	r3, #0
 8000558:	e000      	b.n	800055c <HAL_InitTick+0x4c>
 800055a:	2301      	movs	r3, #1
 800055c:	4618      	mov	r0, r3
 800055e:	3708      	adds	r7, #8
 8000560:	46bd      	mov	sp, r7
 8000562:	bd80      	pop	{r7, pc}
 8000564:	20000064 	.word	0x20000064
 8000568:	2000006c 	.word	0x2000006c
 800056c:	20000068 	.word	0x20000068

08000570 <HAL_GetTick>:
 8000570:	b480      	push	{r7}
 8000572:	af00      	add	r7, sp, #0
 8000574:	4b02      	ldr	r3, [pc, #8]	; (8000580 <HAL_GetTick+0x10>)
 8000576:	681b      	ldr	r3, [r3, #0]
 8000578:	4618      	mov	r0, r3
 800057a:	46bd      	mov	sp, r7
 800057c:	bc80      	pop	{r7}
 800057e:	4770      	bx	lr
 8000580:	20000098 	.word	0x20000098

08000584 <HAL_Delay>:
 8000584:	b580      	push	{r7, lr}
 8000586:	b084      	sub	sp, #16
 8000588:	af00      	add	r7, sp, #0
 800058a:	6078      	str	r0, [r7, #4]
 800058c:	f7ff fff0 	bl	8000570 <HAL_GetTick>
 8000590:	60b8      	str	r0, [r7, #8]
 8000592:	687b      	ldr	r3, [r7, #4]
 8000594:	60fb      	str	r3, [r7, #12]
 8000596:	68fb      	ldr	r3, [r7, #12]
 8000598:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 800059c:	d005      	beq.n	80005aa <HAL_Delay+0x26>
 800059e:	4b0a      	ldr	r3, [pc, #40]	; (80005c8 <HAL_Delay+0x44>)
 80005a0:	781b      	ldrb	r3, [r3, #0]
 80005a2:	461a      	mov	r2, r3
 80005a4:	68fb      	ldr	r3, [r7, #12]
 80005a6:	4413      	add	r3, r2
 80005a8:	60fb      	str	r3, [r7, #12]
 80005aa:	bf00      	nop
 80005ac:	f7ff ffe0 	bl	8000570 <HAL_GetTick>
 80005b0:	4602      	mov	r2, r0
 80005b2:	68bb      	ldr	r3, [r7, #8]
 80005b4:	1ad3      	subs	r3, r2, r3
 80005b6:	68fa      	ldr	r2, [r7, #12]
 80005b8:	429a      	cmp	r2, r3
 80005ba:	d8f7      	bhi.n	80005ac <HAL_Delay+0x28>
 80005bc:	bf00      	nop
 80005be:	bf00      	nop
 80005c0:	3710      	adds	r7, #16
 80005c2:	46bd      	mov	sp, r7
 80005c4:	bd80      	pop	{r7, pc}
 80005c6:	bf00      	nop
 80005c8:	2000006c 	.word	0x2000006c

080005cc <__NVIC_SetPriorityGrouping>:
 80005cc:	b480      	push	{r7}
 80005ce:	b085      	sub	sp, #20
 80005d0:	af00      	add	r7, sp, #0
 80005d2:	6078      	str	r0, [r7, #4]
 80005d4:	687b      	ldr	r3, [r7, #4]
 80005d6:	f003 0307 	and.w	r3, r3, #7
 80005da:	60fb      	str	r3, [r7, #12]
 80005dc:	4b0c      	ldr	r3, [pc, #48]	; (8000610 <__NVIC_SetPriorityGrouping+0x44>)
 80005de:	68db      	ldr	r3, [r3, #12]
 80005e0:	60bb      	str	r3, [r7, #8]
 80005e2:	68ba      	ldr	r2, [r7, #8]
 80005e4:	f64f 03ff 	movw	r3, #63743	; 0xf8ff
 80005e8:	4013      	ands	r3, r2
 80005ea:	60bb      	str	r3, [r7, #8]
 80005ec:	68fb      	ldr	r3, [r7, #12]
 80005ee:	021a      	lsls	r2, r3, #8
 80005f0:	68bb      	ldr	r3, [r7, #8]
 80005f2:	4313      	orrs	r3, r2
 80005f4:	f043 63bf 	orr.w	r3, r3, #100139008	; 0x5f80000
 80005f8:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 80005fc:	60bb      	str	r3, [r7, #8]
 80005fe:	4a04      	ldr	r2, [pc, #16]	; (8000610 <__NVIC_SetPriorityGrouping+0x44>)
 8000600:	68bb      	ldr	r3, [r7, #8]
 8000602:	60d3      	str	r3, [r2, #12]
 8000604:	bf00      	nop
 8000606:	3714      	adds	r7, #20
 8000608:	46bd      	mov	sp, r7
 800060a:	bc80      	pop	{r7}
 800060c:	4770      	bx	lr
 800060e:	bf00      	nop
 8000610:	e000ed00 	.word	0xe000ed00

08000614 <__NVIC_GetPriorityGrouping>:
 8000614:	b480      	push	{r7}
 8000616:	af00      	add	r7, sp, #0
 8000618:	4b04      	ldr	r3, [pc, #16]	; (800062c <__NVIC_GetPriorityGrouping+0x18>)
 800061a:	68db      	ldr	r3, [r3, #12]
 800061c:	0a1b      	lsrs	r3, r3, #8
 800061e:	f003 0307 	and.w	r3, r3, #7
 8000622:	4618      	mov	r0, r3
 8000624:	46bd      	mov	sp, r7
 8000626:	bc80      	pop	{r7}
 8000628:	4770      	bx	lr
 800062a:	bf00      	nop
 800062c:	e000ed00 	.word	0xe000ed00

08000630 <__NVIC_SetPriority>:
 8000630:	b480      	push	{r7}
 8000632:	b083      	sub	sp, #12
 8000634:	af00      	add	r7, sp, #0
 8000636:	4603      	mov	r3, r0
 8000638:	6039      	str	r1, [r7, #0]
 800063a:	71fb      	strb	r3, [r7, #7]
 800063c:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000640:	2b00      	cmp	r3, #0
 8000642:	db0a      	blt.n	800065a <__NVIC_SetPriority+0x2a>
 8000644:	683b      	ldr	r3, [r7, #0]
 8000646:	b2da      	uxtb	r2, r3
 8000648:	490c      	ldr	r1, [pc, #48]	; (800067c <__NVIC_SetPriority+0x4c>)
 800064a:	f997 3007 	ldrsb.w	r3, [r7, #7]
 800064e:	0112      	lsls	r2, r2, #4
 8000650:	b2d2      	uxtb	r2, r2
 8000652:	440b      	add	r3, r1
 8000654:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000658:	e00a      	b.n	8000670 <__NVIC_SetPriority+0x40>
 800065a:	683b      	ldr	r3, [r7, #0]
 800065c:	b2da      	uxtb	r2, r3
 800065e:	4908      	ldr	r1, [pc, #32]	; (8000680 <__NVIC_SetPriority+0x50>)
 8000660:	79fb      	ldrb	r3, [r7, #7]
 8000662:	f003 030f 	and.w	r3, r3, #15
 8000666:	3b04      	subs	r3, #4
 8000668:	0112      	lsls	r2, r2, #4
 800066a:	b2d2      	uxtb	r2, r2
 800066c:	440b      	add	r3, r1
 800066e:	761a      	strb	r2, [r3, #24]
 8000670:	bf00      	nop
 8000672:	370c      	adds	r7, #12
 8000674:	46bd      	mov	sp, r7
 8000676:	bc80      	pop	{r7}
 8000678:	4770      	bx	lr
 800067a:	bf00      	nop
 800067c:	e000e100 	.word	0xe000e100
 8000680:	e000ed00 	.word	0xe000ed00

08000684 <NVIC_EncodePriority>:
 8000684:	b480      	push	{r7}
 8000686:	b089      	sub	sp, #36	; 0x24
 8000688:	af00      	add	r7, sp, #0
 800068a:	60f8      	str	r0, [r7, #12]
 800068c:	60b9      	str	r1, [r7, #8]
 800068e:	607a      	str	r2, [r7, #4]
 8000690:	68fb      	ldr	r3, [r7, #12]
 8000692:	f003 0307 	and.w	r3, r3, #7
 8000696:	61fb      	str	r3, [r7, #28]
 8000698:	69fb      	ldr	r3, [r7, #28]
 800069a:	f1c3 0307 	rsb	r3, r3, #7
 800069e:	2b04      	cmp	r3, #4
 80006a0:	bf28      	it	cs
 80006a2:	2304      	movcs	r3, #4
 80006a4:	61bb      	str	r3, [r7, #24]
 80006a6:	69fb      	ldr	r3, [r7, #28]
 80006a8:	3304      	adds	r3, #4
 80006aa:	2b06      	cmp	r3, #6
 80006ac:	d902      	bls.n	80006b4 <NVIC_EncodePriority+0x30>
 80006ae:	69fb      	ldr	r3, [r7, #28]
 80006b0:	3b03      	subs	r3, #3
 80006b2:	e000      	b.n	80006b6 <NVIC_EncodePriority+0x32>
 80006b4:	2300      	movs	r3, #0
 80006b6:	617b      	str	r3, [r7, #20]
 80006b8:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 80006bc:	69bb      	ldr	r3, [r7, #24]
 80006be:	fa02 f303 	lsl.w	r3, r2, r3
 80006c2:	43da      	mvns	r2, r3
 80006c4:	68bb      	ldr	r3, [r7, #8]
 80006c6:	401a      	ands	r2, r3
 80006c8:	697b      	ldr	r3, [r7, #20]
 80006ca:	409a      	lsls	r2, r3
 80006cc:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 80006d0:	697b      	ldr	r3, [r7, #20]
 80006d2:	fa01 f303 	lsl.w	r3, r1, r3
 80006d6:	43d9      	mvns	r1, r3
 80006d8:	687b      	ldr	r3, [r7, #4]
 80006da:	400b      	ands	r3, r1
 80006dc:	4313      	orrs	r3, r2
 80006de:	4618      	mov	r0, r3
 80006e0:	3724      	adds	r7, #36	; 0x24
 80006e2:	46bd      	mov	sp, r7
 80006e4:	bc80      	pop	{r7}
 80006e6:	4770      	bx	lr

080006e8 <SysTick_Config>:
 80006e8:	b580      	push	{r7, lr}
 80006ea:	b082      	sub	sp, #8
 80006ec:	af00      	add	r7, sp, #0
 80006ee:	6078      	str	r0, [r7, #4]
 80006f0:	687b      	ldr	r3, [r7, #4]
 80006f2:	3b01      	subs	r3, #1
 80006f4:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
 80006f8:	d301      	bcc.n	80006fe <SysTick_Config+0x16>
 80006fa:	2301      	movs	r3, #1
 80006fc:	e00f      	b.n	800071e <SysTick_Config+0x36>
 80006fe:	4a0a      	ldr	r2, [pc, #40]	; (8000728 <SysTick_Config+0x40>)
 8000700:	687b      	ldr	r3, [r7, #4]
 8000702:	3b01      	subs	r3, #1
 8000704:	6053      	str	r3, [r2, #4]
 8000706:	210f      	movs	r1, #15
 8000708:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800070c:	f7ff ff90 	bl	8000630 <__NVIC_SetPriority>
 8000710:	4b05      	ldr	r3, [pc, #20]	; (8000728 <SysTick_Config+0x40>)
 8000712:	2200      	movs	r2, #0
 8000714:	609a      	str	r2, [r3, #8]
 8000716:	4b04      	ldr	r3, [pc, #16]	; (8000728 <SysTick_Config+0x40>)
 8000718:	2207      	movs	r2, #7
 800071a:	601a      	str	r2, [r3, #0]
 800071c:	2300      	movs	r3, #0
 800071e:	4618      	mov	r0, r3
 8000720:	3708      	adds	r7, #8
 8000722:	46bd      	mov	sp, r7
 8000724:	bd80      	pop	{r7, pc}
 8000726:	bf00      	nop
 8000728:	e000e010 	.word	0xe000e010

0800072c <HAL_NVIC_SetPriorityGrouping>:
 800072c:	b580      	push	{r7, lr}
 800072e:	b082      	sub	sp, #8
 8000730:	af00      	add	r7, sp, #0
 8000732:	6078      	str	r0, [r7, #4]
 8000734:	6878      	ldr	r0, [r7, #4]
 8000736:	f7ff ff49 	bl	80005cc <__NVIC_SetPriorityGrouping>
 800073a:	bf00      	nop
 800073c:	3708      	adds	r7, #8
 800073e:	46bd      	mov	sp, r7
 8000740:	bd80      	pop	{r7, pc}

08000742 <HAL_NVIC_SetPriority>:
 8000742:	b580      	push	{r7, lr}
 8000744:	b086      	sub	sp, #24
 8000746:	af00      	add	r7, sp, #0
 8000748:	4603      	mov	r3, r0
 800074a:	60b9      	str	r1, [r7, #8]
 800074c:	607a      	str	r2, [r7, #4]
 800074e:	73fb      	strb	r3, [r7, #15]
 8000750:	2300      	movs	r3, #0
 8000752:	617b      	str	r3, [r7, #20]
 8000754:	f7ff ff5e 	bl	8000614 <__NVIC_GetPriorityGrouping>
 8000758:	6178      	str	r0, [r7, #20]
 800075a:	687a      	ldr	r2, [r7, #4]
 800075c:	68b9      	ldr	r1, [r7, #8]
 800075e:	6978      	ldr	r0, [r7, #20]
 8000760:	f7ff ff90 	bl	8000684 <NVIC_EncodePriority>
 8000764:	4602      	mov	r2, r0
 8000766:	f997 300f 	ldrsb.w	r3, [r7, #15]
 800076a:	4611      	mov	r1, r2
 800076c:	4618      	mov	r0, r3
 800076e:	f7ff ff5f 	bl	8000630 <__NVIC_SetPriority>
 8000772:	bf00      	nop
 8000774:	3718      	adds	r7, #24
 8000776:	46bd      	mov	sp, r7
 8000778:	bd80      	pop	{r7, pc}

0800077a <HAL_SYSTICK_Config>:
 800077a:	b580      	push	{r7, lr}
 800077c:	b082      	sub	sp, #8
 800077e:	af00      	add	r7, sp, #0
 8000780:	6078      	str	r0, [r7, #4]
 8000782:	6878      	ldr	r0, [r7, #4]
 8000784:	f7ff ffb0 	bl	80006e8 <SysTick_Config>
 8000788:	4603      	mov	r3, r0
 800078a:	4618      	mov	r0, r3
 800078c:	3708      	adds	r7, #8
 800078e:	46bd      	mov	sp, r7
 8000790:	bd80      	pop	{r7, pc}

08000792 <HAL_DMA_Abort>:
 8000792:	b480      	push	{r7}
 8000794:	b085      	sub	sp, #20
 8000796:	af00      	add	r7, sp, #0
 8000798:	6078      	str	r0, [r7, #4]
 800079a:	2300      	movs	r3, #0
 800079c:	73fb      	strb	r3, [r7, #15]
 800079e:	687b      	ldr	r3, [r7, #4]
 80007a0:	f893 3021 	ldrb.w	r3, [r3, #33]	; 0x21
 80007a4:	b2db      	uxtb	r3, r3
 80007a6:	2b02      	cmp	r3, #2
 80007a8:	d008      	beq.n	80007bc <HAL_DMA_Abort+0x2a>
 80007aa:	687b      	ldr	r3, [r7, #4]
 80007ac:	2204      	movs	r2, #4
 80007ae:	639a      	str	r2, [r3, #56]	; 0x38
 80007b0:	687b      	ldr	r3, [r7, #4]
 80007b2:	2200      	movs	r2, #0
 80007b4:	f883 2020 	strb.w	r2, [r3, #32]
 80007b8:	2301      	movs	r3, #1
 80007ba:	e020      	b.n	80007fe <HAL_DMA_Abort+0x6c>
 80007bc:	687b      	ldr	r3, [r7, #4]
 80007be:	681b      	ldr	r3, [r3, #0]
 80007c0:	681a      	ldr	r2, [r3, #0]
 80007c2:	687b      	ldr	r3, [r7, #4]
 80007c4:	681b      	ldr	r3, [r3, #0]
 80007c6:	f022 020e 	bic.w	r2, r2, #14
 80007ca:	601a      	str	r2, [r3, #0]
 80007cc:	687b      	ldr	r3, [r7, #4]
 80007ce:	681b      	ldr	r3, [r3, #0]
 80007d0:	681a      	ldr	r2, [r3, #0]
 80007d2:	687b      	ldr	r3, [r7, #4]
 80007d4:	681b      	ldr	r3, [r3, #0]
 80007d6:	f022 0201 	bic.w	r2, r2, #1
 80007da:	601a      	str	r2, [r3, #0]
 80007dc:	687b      	ldr	r3, [r7, #4]
 80007de:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80007e0:	687b      	ldr	r3, [r7, #4]
 80007e2:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 80007e4:	2101      	movs	r1, #1
 80007e6:	fa01 f202 	lsl.w	r2, r1, r2
 80007ea:	605a      	str	r2, [r3, #4]
 80007ec:	687b      	ldr	r3, [r7, #4]
 80007ee:	2201      	movs	r2, #1
 80007f0:	f883 2021 	strb.w	r2, [r3, #33]	; 0x21
 80007f4:	687b      	ldr	r3, [r7, #4]
 80007f6:	2200      	movs	r2, #0
 80007f8:	f883 2020 	strb.w	r2, [r3, #32]
 80007fc:	7bfb      	ldrb	r3, [r7, #15]
 80007fe:	4618      	mov	r0, r3
 8000800:	3714      	adds	r7, #20
 8000802:	46bd      	mov	sp, r7
 8000804:	bc80      	pop	{r7}
 8000806:	4770      	bx	lr

08000808 <HAL_DMA_Abort_IT>:
 8000808:	b580      	push	{r7, lr}
 800080a:	b084      	sub	sp, #16
 800080c:	af00      	add	r7, sp, #0
 800080e:	6078      	str	r0, [r7, #4]
 8000810:	2300      	movs	r3, #0
 8000812:	73fb      	strb	r3, [r7, #15]
 8000814:	687b      	ldr	r3, [r7, #4]
 8000816:	f893 3021 	ldrb.w	r3, [r3, #33]	; 0x21
 800081a:	b2db      	uxtb	r3, r3
 800081c:	2b02      	cmp	r3, #2
 800081e:	d005      	beq.n	800082c <HAL_DMA_Abort_IT+0x24>
 8000820:	687b      	ldr	r3, [r7, #4]
 8000822:	2204      	movs	r2, #4
 8000824:	639a      	str	r2, [r3, #56]	; 0x38
 8000826:	2301      	movs	r3, #1
 8000828:	73fb      	strb	r3, [r7, #15]
 800082a:	e0d6      	b.n	80009da <HAL_DMA_Abort_IT+0x1d2>
 800082c:	687b      	ldr	r3, [r7, #4]
 800082e:	681b      	ldr	r3, [r3, #0]
 8000830:	681a      	ldr	r2, [r3, #0]
 8000832:	687b      	ldr	r3, [r7, #4]
 8000834:	681b      	ldr	r3, [r3, #0]
 8000836:	f022 020e 	bic.w	r2, r2, #14
 800083a:	601a      	str	r2, [r3, #0]
 800083c:	687b      	ldr	r3, [r7, #4]
 800083e:	681b      	ldr	r3, [r3, #0]
 8000840:	681a      	ldr	r2, [r3, #0]
 8000842:	687b      	ldr	r3, [r7, #4]
 8000844:	681b      	ldr	r3, [r3, #0]
 8000846:	f022 0201 	bic.w	r2, r2, #1
 800084a:	601a      	str	r2, [r3, #0]
 800084c:	687b      	ldr	r3, [r7, #4]
 800084e:	681b      	ldr	r3, [r3, #0]
 8000850:	461a      	mov	r2, r3
 8000852:	4b64      	ldr	r3, [pc, #400]	; (80009e4 <HAL_DMA_Abort_IT+0x1dc>)
 8000854:	429a      	cmp	r2, r3
 8000856:	d958      	bls.n	800090a <HAL_DMA_Abort_IT+0x102>
 8000858:	687b      	ldr	r3, [r7, #4]
 800085a:	681b      	ldr	r3, [r3, #0]
 800085c:	4a62      	ldr	r2, [pc, #392]	; (80009e8 <HAL_DMA_Abort_IT+0x1e0>)
 800085e:	4293      	cmp	r3, r2
 8000860:	d04f      	beq.n	8000902 <HAL_DMA_Abort_IT+0xfa>
 8000862:	687b      	ldr	r3, [r7, #4]
 8000864:	681b      	ldr	r3, [r3, #0]
 8000866:	4a61      	ldr	r2, [pc, #388]	; (80009ec <HAL_DMA_Abort_IT+0x1e4>)
 8000868:	4293      	cmp	r3, r2
 800086a:	d048      	beq.n	80008fe <HAL_DMA_Abort_IT+0xf6>
 800086c:	687b      	ldr	r3, [r7, #4]
 800086e:	681b      	ldr	r3, [r3, #0]
 8000870:	4a5f      	ldr	r2, [pc, #380]	; (80009f0 <HAL_DMA_Abort_IT+0x1e8>)
 8000872:	4293      	cmp	r3, r2
 8000874:	d040      	beq.n	80008f8 <HAL_DMA_Abort_IT+0xf0>
 8000876:	687b      	ldr	r3, [r7, #4]
 8000878:	681b      	ldr	r3, [r3, #0]
 800087a:	4a5e      	ldr	r2, [pc, #376]	; (80009f4 <HAL_DMA_Abort_IT+0x1ec>)
 800087c:	4293      	cmp	r3, r2
 800087e:	d038      	beq.n	80008f2 <HAL_DMA_Abort_IT+0xea>
 8000880:	687b      	ldr	r3, [r7, #4]
 8000882:	681b      	ldr	r3, [r3, #0]
 8000884:	4a5c      	ldr	r2, [pc, #368]	; (80009f8 <HAL_DMA_Abort_IT+0x1f0>)
 8000886:	4293      	cmp	r3, r2
 8000888:	d030      	beq.n	80008ec <HAL_DMA_Abort_IT+0xe4>
 800088a:	687b      	ldr	r3, [r7, #4]
 800088c:	681b      	ldr	r3, [r3, #0]
 800088e:	4a5b      	ldr	r2, [pc, #364]	; (80009fc <HAL_DMA_Abort_IT+0x1f4>)
 8000890:	4293      	cmp	r3, r2
 8000892:	d028      	beq.n	80008e6 <HAL_DMA_Abort_IT+0xde>
 8000894:	687b      	ldr	r3, [r7, #4]
 8000896:	681b      	ldr	r3, [r3, #0]
 8000898:	4a52      	ldr	r2, [pc, #328]	; (80009e4 <HAL_DMA_Abort_IT+0x1dc>)
 800089a:	4293      	cmp	r3, r2
 800089c:	d020      	beq.n	80008e0 <HAL_DMA_Abort_IT+0xd8>
 800089e:	687b      	ldr	r3, [r7, #4]
 80008a0:	681b      	ldr	r3, [r3, #0]
 80008a2:	4a57      	ldr	r2, [pc, #348]	; (8000a00 <HAL_DMA_Abort_IT+0x1f8>)
 80008a4:	4293      	cmp	r3, r2
 80008a6:	d019      	beq.n	80008dc <HAL_DMA_Abort_IT+0xd4>
 80008a8:	687b      	ldr	r3, [r7, #4]
 80008aa:	681b      	ldr	r3, [r3, #0]
 80008ac:	4a55      	ldr	r2, [pc, #340]	; (8000a04 <HAL_DMA_Abort_IT+0x1fc>)
 80008ae:	4293      	cmp	r3, r2
 80008b0:	d012      	beq.n	80008d8 <HAL_DMA_Abort_IT+0xd0>
 80008b2:	687b      	ldr	r3, [r7, #4]
 80008b4:	681b      	ldr	r3, [r3, #0]
 80008b6:	4a54      	ldr	r2, [pc, #336]	; (8000a08 <HAL_DMA_Abort_IT+0x200>)
 80008b8:	4293      	cmp	r3, r2
 80008ba:	d00a      	beq.n	80008d2 <HAL_DMA_Abort_IT+0xca>
 80008bc:	687b      	ldr	r3, [r7, #4]
 80008be:	681b      	ldr	r3, [r3, #0]
 80008c0:	4a52      	ldr	r2, [pc, #328]	; (8000a0c <HAL_DMA_Abort_IT+0x204>)
 80008c2:	4293      	cmp	r3, r2
 80008c4:	d102      	bne.n	80008cc <HAL_DMA_Abort_IT+0xc4>
 80008c6:	f44f 5380 	mov.w	r3, #4096	; 0x1000
 80008ca:	e01b      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008cc:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 80008d0:	e018      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008d2:	f44f 7380 	mov.w	r3, #256	; 0x100
 80008d6:	e015      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008d8:	2310      	movs	r3, #16
 80008da:	e013      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008dc:	2301      	movs	r3, #1
 80008de:	e011      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008e0:	f04f 7380 	mov.w	r3, #16777216	; 0x1000000
 80008e4:	e00e      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008e6:	f44f 1380 	mov.w	r3, #1048576	; 0x100000
 80008ea:	e00b      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008ec:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 80008f0:	e008      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008f2:	f44f 5380 	mov.w	r3, #4096	; 0x1000
 80008f6:	e005      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008f8:	f44f 7380 	mov.w	r3, #256	; 0x100
 80008fc:	e002      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 80008fe:	2310      	movs	r3, #16
 8000900:	e000      	b.n	8000904 <HAL_DMA_Abort_IT+0xfc>
 8000902:	2301      	movs	r3, #1
 8000904:	4a42      	ldr	r2, [pc, #264]	; (8000a10 <HAL_DMA_Abort_IT+0x208>)
 8000906:	6053      	str	r3, [r2, #4]
 8000908:	e057      	b.n	80009ba <HAL_DMA_Abort_IT+0x1b2>
 800090a:	687b      	ldr	r3, [r7, #4]
 800090c:	681b      	ldr	r3, [r3, #0]
 800090e:	4a36      	ldr	r2, [pc, #216]	; (80009e8 <HAL_DMA_Abort_IT+0x1e0>)
 8000910:	4293      	cmp	r3, r2
 8000912:	d04f      	beq.n	80009b4 <HAL_DMA_Abort_IT+0x1ac>
 8000914:	687b      	ldr	r3, [r7, #4]
 8000916:	681b      	ldr	r3, [r3, #0]
 8000918:	4a34      	ldr	r2, [pc, #208]	; (80009ec <HAL_DMA_Abort_IT+0x1e4>)
 800091a:	4293      	cmp	r3, r2
 800091c:	d048      	beq.n	80009b0 <HAL_DMA_Abort_IT+0x1a8>
 800091e:	687b      	ldr	r3, [r7, #4]
 8000920:	681b      	ldr	r3, [r3, #0]
 8000922:	4a33      	ldr	r2, [pc, #204]	; (80009f0 <HAL_DMA_Abort_IT+0x1e8>)
 8000924:	4293      	cmp	r3, r2
 8000926:	d040      	beq.n	80009aa <HAL_DMA_Abort_IT+0x1a2>
 8000928:	687b      	ldr	r3, [r7, #4]
 800092a:	681b      	ldr	r3, [r3, #0]
 800092c:	4a31      	ldr	r2, [pc, #196]	; (80009f4 <HAL_DMA_Abort_IT+0x1ec>)
 800092e:	4293      	cmp	r3, r2
 8000930:	d038      	beq.n	80009a4 <HAL_DMA_Abort_IT+0x19c>
 8000932:	687b      	ldr	r3, [r7, #4]
 8000934:	681b      	ldr	r3, [r3, #0]
 8000936:	4a30      	ldr	r2, [pc, #192]	; (80009f8 <HAL_DMA_Abort_IT+0x1f0>)
 8000938:	4293      	cmp	r3, r2
 800093a:	d030      	beq.n	800099e <HAL_DMA_Abort_IT+0x196>
 800093c:	687b      	ldr	r3, [r7, #4]
 800093e:	681b      	ldr	r3, [r3, #0]
 8000940:	4a2e      	ldr	r2, [pc, #184]	; (80009fc <HAL_DMA_Abort_IT+0x1f4>)
 8000942:	4293      	cmp	r3, r2
 8000944:	d028      	beq.n	8000998 <HAL_DMA_Abort_IT+0x190>
 8000946:	687b      	ldr	r3, [r7, #4]
 8000948:	681b      	ldr	r3, [r3, #0]
 800094a:	4a26      	ldr	r2, [pc, #152]	; (80009e4 <HAL_DMA_Abort_IT+0x1dc>)
 800094c:	4293      	cmp	r3, r2
 800094e:	d020      	beq.n	8000992 <HAL_DMA_Abort_IT+0x18a>
 8000950:	687b      	ldr	r3, [r7, #4]
 8000952:	681b      	ldr	r3, [r3, #0]
 8000954:	4a2a      	ldr	r2, [pc, #168]	; (8000a00 <HAL_DMA_Abort_IT+0x1f8>)
 8000956:	4293      	cmp	r3, r2
 8000958:	d019      	beq.n	800098e <HAL_DMA_Abort_IT+0x186>
 800095a:	687b      	ldr	r3, [r7, #4]
 800095c:	681b      	ldr	r3, [r3, #0]
 800095e:	4a29      	ldr	r2, [pc, #164]	; (8000a04 <HAL_DMA_Abort_IT+0x1fc>)
 8000960:	4293      	cmp	r3, r2
 8000962:	d012      	beq.n	800098a <HAL_DMA_Abort_IT+0x182>
 8000964:	687b      	ldr	r3, [r7, #4]
 8000966:	681b      	ldr	r3, [r3, #0]
 8000968:	4a27      	ldr	r2, [pc, #156]	; (8000a08 <HAL_DMA_Abort_IT+0x200>)
 800096a:	4293      	cmp	r3, r2
 800096c:	d00a      	beq.n	8000984 <HAL_DMA_Abort_IT+0x17c>
 800096e:	687b      	ldr	r3, [r7, #4]
 8000970:	681b      	ldr	r3, [r3, #0]
 8000972:	4a26      	ldr	r2, [pc, #152]	; (8000a0c <HAL_DMA_Abort_IT+0x204>)
 8000974:	4293      	cmp	r3, r2
 8000976:	d102      	bne.n	800097e <HAL_DMA_Abort_IT+0x176>
 8000978:	f44f 5380 	mov.w	r3, #4096	; 0x1000
 800097c:	e01b      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 800097e:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 8000982:	e018      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 8000984:	f44f 7380 	mov.w	r3, #256	; 0x100
 8000988:	e015      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 800098a:	2310      	movs	r3, #16
 800098c:	e013      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 800098e:	2301      	movs	r3, #1
 8000990:	e011      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 8000992:	f04f 7380 	mov.w	r3, #16777216	; 0x1000000
 8000996:	e00e      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 8000998:	f44f 1380 	mov.w	r3, #1048576	; 0x100000
 800099c:	e00b      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 800099e:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 80009a2:	e008      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 80009a4:	f44f 5380 	mov.w	r3, #4096	; 0x1000
 80009a8:	e005      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 80009aa:	f44f 7380 	mov.w	r3, #256	; 0x100
 80009ae:	e002      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 80009b0:	2310      	movs	r3, #16
 80009b2:	e000      	b.n	80009b6 <HAL_DMA_Abort_IT+0x1ae>
 80009b4:	2301      	movs	r3, #1
 80009b6:	4a17      	ldr	r2, [pc, #92]	; (8000a14 <HAL_DMA_Abort_IT+0x20c>)
 80009b8:	6053      	str	r3, [r2, #4]
 80009ba:	687b      	ldr	r3, [r7, #4]
 80009bc:	2201      	movs	r2, #1
 80009be:	f883 2021 	strb.w	r2, [r3, #33]	; 0x21
 80009c2:	687b      	ldr	r3, [r7, #4]
 80009c4:	2200      	movs	r2, #0
 80009c6:	f883 2020 	strb.w	r2, [r3, #32]
 80009ca:	687b      	ldr	r3, [r7, #4]
 80009cc:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 80009ce:	2b00      	cmp	r3, #0
 80009d0:	d003      	beq.n	80009da <HAL_DMA_Abort_IT+0x1d2>
 80009d2:	687b      	ldr	r3, [r7, #4]
 80009d4:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 80009d6:	6878      	ldr	r0, [r7, #4]
 80009d8:	4798      	blx	r3
 80009da:	7bfb      	ldrb	r3, [r7, #15]
 80009dc:	4618      	mov	r0, r3
 80009de:	3710      	adds	r7, #16
 80009e0:	46bd      	mov	sp, r7
 80009e2:	bd80      	pop	{r7, pc}
 80009e4:	40020080 	.word	0x40020080
 80009e8:	40020008 	.word	0x40020008
 80009ec:	4002001c 	.word	0x4002001c
 80009f0:	40020030 	.word	0x40020030
 80009f4:	40020044 	.word	0x40020044
 80009f8:	40020058 	.word	0x40020058
 80009fc:	4002006c 	.word	0x4002006c
 8000a00:	40020408 	.word	0x40020408
 8000a04:	4002041c 	.word	0x4002041c
 8000a08:	40020430 	.word	0x40020430
 8000a0c:	40020444 	.word	0x40020444
 8000a10:	40020400 	.word	0x40020400
 8000a14:	40020000 	.word	0x40020000

08000a18 <HAL_FLASH_Program>:
 8000a18:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000a1a:	b087      	sub	sp, #28
 8000a1c:	af00      	add	r7, sp, #0
 8000a1e:	60f8      	str	r0, [r7, #12]
 8000a20:	60b9      	str	r1, [r7, #8]
 8000a22:	e9c7 2300 	strd	r2, r3, [r7]
 8000a26:	2301      	movs	r3, #1
 8000a28:	75fb      	strb	r3, [r7, #23]
 8000a2a:	2300      	movs	r3, #0
 8000a2c:	75bb      	strb	r3, [r7, #22]
 8000a2e:	2300      	movs	r3, #0
 8000a30:	757b      	strb	r3, [r7, #21]
 8000a32:	4b2f      	ldr	r3, [pc, #188]	; (8000af0 <HAL_FLASH_Program+0xd8>)
 8000a34:	7e1b      	ldrb	r3, [r3, #24]
 8000a36:	2b01      	cmp	r3, #1
 8000a38:	d101      	bne.n	8000a3e <HAL_FLASH_Program+0x26>
 8000a3a:	2302      	movs	r3, #2
 8000a3c:	e054      	b.n	8000ae8 <HAL_FLASH_Program+0xd0>
 8000a3e:	4b2c      	ldr	r3, [pc, #176]	; (8000af0 <HAL_FLASH_Program+0xd8>)
 8000a40:	2201      	movs	r2, #1
 8000a42:	761a      	strb	r2, [r3, #24]
 8000a44:	f24c 3050 	movw	r0, #50000	; 0xc350
 8000a48:	f000 f8a8 	bl	8000b9c <FLASH_WaitForLastOperation>
 8000a4c:	4603      	mov	r3, r0
 8000a4e:	75fb      	strb	r3, [r7, #23]
 8000a50:	7dfb      	ldrb	r3, [r7, #23]
 8000a52:	2b00      	cmp	r3, #0
 8000a54:	d144      	bne.n	8000ae0 <HAL_FLASH_Program+0xc8>
 8000a56:	68fb      	ldr	r3, [r7, #12]
 8000a58:	2b01      	cmp	r3, #1
 8000a5a:	d102      	bne.n	8000a62 <HAL_FLASH_Program+0x4a>
 8000a5c:	2301      	movs	r3, #1
 8000a5e:	757b      	strb	r3, [r7, #21]
 8000a60:	e007      	b.n	8000a72 <HAL_FLASH_Program+0x5a>
 8000a62:	68fb      	ldr	r3, [r7, #12]
 8000a64:	2b02      	cmp	r3, #2
 8000a66:	d102      	bne.n	8000a6e <HAL_FLASH_Program+0x56>
 8000a68:	2302      	movs	r3, #2
 8000a6a:	757b      	strb	r3, [r7, #21]
 8000a6c:	e001      	b.n	8000a72 <HAL_FLASH_Program+0x5a>
 8000a6e:	2304      	movs	r3, #4
 8000a70:	757b      	strb	r3, [r7, #21]
 8000a72:	2300      	movs	r3, #0
 8000a74:	75bb      	strb	r3, [r7, #22]
 8000a76:	e02d      	b.n	8000ad4 <HAL_FLASH_Program+0xbc>
 8000a78:	7dbb      	ldrb	r3, [r7, #22]
 8000a7a:	005a      	lsls	r2, r3, #1
 8000a7c:	68bb      	ldr	r3, [r7, #8]
 8000a7e:	eb02 0c03 	add.w	ip, r2, r3
 8000a82:	7dbb      	ldrb	r3, [r7, #22]
 8000a84:	0119      	lsls	r1, r3, #4
 8000a86:	e9d7 2300 	ldrd	r2, r3, [r7]
 8000a8a:	f1c1 0620 	rsb	r6, r1, #32
 8000a8e:	f1a1 0020 	sub.w	r0, r1, #32
 8000a92:	fa22 f401 	lsr.w	r4, r2, r1
 8000a96:	fa03 f606 	lsl.w	r6, r3, r6
 8000a9a:	4334      	orrs	r4, r6
 8000a9c:	fa23 f000 	lsr.w	r0, r3, r0
 8000aa0:	4304      	orrs	r4, r0
 8000aa2:	fa23 f501 	lsr.w	r5, r3, r1
 8000aa6:	b2a3      	uxth	r3, r4
 8000aa8:	4619      	mov	r1, r3
 8000aaa:	4660      	mov	r0, ip
 8000aac:	f000 f85a 	bl	8000b64 <FLASH_Program_HalfWord>
 8000ab0:	f24c 3050 	movw	r0, #50000	; 0xc350
 8000ab4:	f000 f872 	bl	8000b9c <FLASH_WaitForLastOperation>
 8000ab8:	4603      	mov	r3, r0
 8000aba:	75fb      	strb	r3, [r7, #23]
 8000abc:	4b0d      	ldr	r3, [pc, #52]	; (8000af4 <HAL_FLASH_Program+0xdc>)
 8000abe:	691b      	ldr	r3, [r3, #16]
 8000ac0:	4a0c      	ldr	r2, [pc, #48]	; (8000af4 <HAL_FLASH_Program+0xdc>)
 8000ac2:	f023 0301 	bic.w	r3, r3, #1
 8000ac6:	6113      	str	r3, [r2, #16]
 8000ac8:	7dfb      	ldrb	r3, [r7, #23]
 8000aca:	2b00      	cmp	r3, #0
 8000acc:	d107      	bne.n	8000ade <HAL_FLASH_Program+0xc6>
 8000ace:	7dbb      	ldrb	r3, [r7, #22]
 8000ad0:	3301      	adds	r3, #1
 8000ad2:	75bb      	strb	r3, [r7, #22]
 8000ad4:	7dba      	ldrb	r2, [r7, #22]
 8000ad6:	7d7b      	ldrb	r3, [r7, #21]
 8000ad8:	429a      	cmp	r2, r3
 8000ada:	d3cd      	bcc.n	8000a78 <HAL_FLASH_Program+0x60>
 8000adc:	e000      	b.n	8000ae0 <HAL_FLASH_Program+0xc8>
 8000ade:	bf00      	nop
 8000ae0:	4b03      	ldr	r3, [pc, #12]	; (8000af0 <HAL_FLASH_Program+0xd8>)
 8000ae2:	2200      	movs	r2, #0
 8000ae4:	761a      	strb	r2, [r3, #24]
 8000ae6:	7dfb      	ldrb	r3, [r7, #23]
 8000ae8:	4618      	mov	r0, r3
 8000aea:	371c      	adds	r7, #28
 8000aec:	46bd      	mov	sp, r7
 8000aee:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000af0:	200000a0 	.word	0x200000a0
 8000af4:	40022000 	.word	0x40022000

08000af8 <HAL_FLASH_Unlock>:
 8000af8:	b480      	push	{r7}
 8000afa:	b083      	sub	sp, #12
 8000afc:	af00      	add	r7, sp, #0
 8000afe:	2300      	movs	r3, #0
 8000b00:	71fb      	strb	r3, [r7, #7]
 8000b02:	4b0d      	ldr	r3, [pc, #52]	; (8000b38 <HAL_FLASH_Unlock+0x40>)
 8000b04:	691b      	ldr	r3, [r3, #16]
 8000b06:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8000b0a:	2b00      	cmp	r3, #0
 8000b0c:	d00d      	beq.n	8000b2a <HAL_FLASH_Unlock+0x32>
 8000b0e:	4b0a      	ldr	r3, [pc, #40]	; (8000b38 <HAL_FLASH_Unlock+0x40>)
 8000b10:	4a0a      	ldr	r2, [pc, #40]	; (8000b3c <HAL_FLASH_Unlock+0x44>)
 8000b12:	605a      	str	r2, [r3, #4]
 8000b14:	4b08      	ldr	r3, [pc, #32]	; (8000b38 <HAL_FLASH_Unlock+0x40>)
 8000b16:	4a0a      	ldr	r2, [pc, #40]	; (8000b40 <HAL_FLASH_Unlock+0x48>)
 8000b18:	605a      	str	r2, [r3, #4]
 8000b1a:	4b07      	ldr	r3, [pc, #28]	; (8000b38 <HAL_FLASH_Unlock+0x40>)
 8000b1c:	691b      	ldr	r3, [r3, #16]
 8000b1e:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8000b22:	2b00      	cmp	r3, #0
 8000b24:	d001      	beq.n	8000b2a <HAL_FLASH_Unlock+0x32>
 8000b26:	2301      	movs	r3, #1
 8000b28:	71fb      	strb	r3, [r7, #7]
 8000b2a:	79fb      	ldrb	r3, [r7, #7]
 8000b2c:	4618      	mov	r0, r3
 8000b2e:	370c      	adds	r7, #12
 8000b30:	46bd      	mov	sp, r7
 8000b32:	bc80      	pop	{r7}
 8000b34:	4770      	bx	lr
 8000b36:	bf00      	nop
 8000b38:	40022000 	.word	0x40022000
 8000b3c:	45670123 	.word	0x45670123
 8000b40:	cdef89ab 	.word	0xcdef89ab

08000b44 <HAL_FLASH_Lock>:
 8000b44:	b480      	push	{r7}
 8000b46:	af00      	add	r7, sp, #0
 8000b48:	4b05      	ldr	r3, [pc, #20]	; (8000b60 <HAL_FLASH_Lock+0x1c>)
 8000b4a:	691b      	ldr	r3, [r3, #16]
 8000b4c:	4a04      	ldr	r2, [pc, #16]	; (8000b60 <HAL_FLASH_Lock+0x1c>)
 8000b4e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8000b52:	6113      	str	r3, [r2, #16]
 8000b54:	2300      	movs	r3, #0
 8000b56:	4618      	mov	r0, r3
 8000b58:	46bd      	mov	sp, r7
 8000b5a:	bc80      	pop	{r7}
 8000b5c:	4770      	bx	lr
 8000b5e:	bf00      	nop
 8000b60:	40022000 	.word	0x40022000

08000b64 <FLASH_Program_HalfWord>:
 8000b64:	b480      	push	{r7}
 8000b66:	b083      	sub	sp, #12
 8000b68:	af00      	add	r7, sp, #0
 8000b6a:	6078      	str	r0, [r7, #4]
 8000b6c:	460b      	mov	r3, r1
 8000b6e:	807b      	strh	r3, [r7, #2]
 8000b70:	4b08      	ldr	r3, [pc, #32]	; (8000b94 <FLASH_Program_HalfWord+0x30>)
 8000b72:	2200      	movs	r2, #0
 8000b74:	61da      	str	r2, [r3, #28]
 8000b76:	4b08      	ldr	r3, [pc, #32]	; (8000b98 <FLASH_Program_HalfWord+0x34>)
 8000b78:	691b      	ldr	r3, [r3, #16]
 8000b7a:	4a07      	ldr	r2, [pc, #28]	; (8000b98 <FLASH_Program_HalfWord+0x34>)
 8000b7c:	f043 0301 	orr.w	r3, r3, #1
 8000b80:	6113      	str	r3, [r2, #16]
 8000b82:	687b      	ldr	r3, [r7, #4]
 8000b84:	887a      	ldrh	r2, [r7, #2]
 8000b86:	801a      	strh	r2, [r3, #0]
 8000b88:	bf00      	nop
 8000b8a:	370c      	adds	r7, #12
 8000b8c:	46bd      	mov	sp, r7
 8000b8e:	bc80      	pop	{r7}
 8000b90:	4770      	bx	lr
 8000b92:	bf00      	nop
 8000b94:	200000a0 	.word	0x200000a0
 8000b98:	40022000 	.word	0x40022000

08000b9c <FLASH_WaitForLastOperation>:
 8000b9c:	b580      	push	{r7, lr}
 8000b9e:	b084      	sub	sp, #16
 8000ba0:	af00      	add	r7, sp, #0
 8000ba2:	6078      	str	r0, [r7, #4]
 8000ba4:	f7ff fce4 	bl	8000570 <HAL_GetTick>
 8000ba8:	60f8      	str	r0, [r7, #12]
 8000baa:	e010      	b.n	8000bce <FLASH_WaitForLastOperation+0x32>
 8000bac:	687b      	ldr	r3, [r7, #4]
 8000bae:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 8000bb2:	d00c      	beq.n	8000bce <FLASH_WaitForLastOperation+0x32>
 8000bb4:	687b      	ldr	r3, [r7, #4]
 8000bb6:	2b00      	cmp	r3, #0
 8000bb8:	d007      	beq.n	8000bca <FLASH_WaitForLastOperation+0x2e>
 8000bba:	f7ff fcd9 	bl	8000570 <HAL_GetTick>
 8000bbe:	4602      	mov	r2, r0
 8000bc0:	68fb      	ldr	r3, [r7, #12]
 8000bc2:	1ad3      	subs	r3, r2, r3
 8000bc4:	687a      	ldr	r2, [r7, #4]
 8000bc6:	429a      	cmp	r2, r3
 8000bc8:	d201      	bcs.n	8000bce <FLASH_WaitForLastOperation+0x32>
 8000bca:	2303      	movs	r3, #3
 8000bcc:	e025      	b.n	8000c1a <FLASH_WaitForLastOperation+0x7e>
 8000bce:	4b15      	ldr	r3, [pc, #84]	; (8000c24 <FLASH_WaitForLastOperation+0x88>)
 8000bd0:	68db      	ldr	r3, [r3, #12]
 8000bd2:	f003 0301 	and.w	r3, r3, #1
 8000bd6:	2b00      	cmp	r3, #0
 8000bd8:	d1e8      	bne.n	8000bac <FLASH_WaitForLastOperation+0x10>
 8000bda:	4b12      	ldr	r3, [pc, #72]	; (8000c24 <FLASH_WaitForLastOperation+0x88>)
 8000bdc:	68db      	ldr	r3, [r3, #12]
 8000bde:	f003 0320 	and.w	r3, r3, #32
 8000be2:	2b00      	cmp	r3, #0
 8000be4:	d002      	beq.n	8000bec <FLASH_WaitForLastOperation+0x50>
 8000be6:	4b0f      	ldr	r3, [pc, #60]	; (8000c24 <FLASH_WaitForLastOperation+0x88>)
 8000be8:	2220      	movs	r2, #32
 8000bea:	60da      	str	r2, [r3, #12]
 8000bec:	4b0d      	ldr	r3, [pc, #52]	; (8000c24 <FLASH_WaitForLastOperation+0x88>)
 8000bee:	68db      	ldr	r3, [r3, #12]
 8000bf0:	f003 0310 	and.w	r3, r3, #16
 8000bf4:	2b00      	cmp	r3, #0
 8000bf6:	d10b      	bne.n	8000c10 <FLASH_WaitForLastOperation+0x74>
 8000bf8:	4b0a      	ldr	r3, [pc, #40]	; (8000c24 <FLASH_WaitForLastOperation+0x88>)
 8000bfa:	69db      	ldr	r3, [r3, #28]
 8000bfc:	f003 0301 	and.w	r3, r3, #1
 8000c00:	2b00      	cmp	r3, #0
 8000c02:	d105      	bne.n	8000c10 <FLASH_WaitForLastOperation+0x74>
 8000c04:	4b07      	ldr	r3, [pc, #28]	; (8000c24 <FLASH_WaitForLastOperation+0x88>)
 8000c06:	68db      	ldr	r3, [r3, #12]
 8000c08:	f003 0304 	and.w	r3, r3, #4
 8000c0c:	2b00      	cmp	r3, #0
 8000c0e:	d003      	beq.n	8000c18 <FLASH_WaitForLastOperation+0x7c>
 8000c10:	f000 f80a 	bl	8000c28 <FLASH_SetErrorCode>
 8000c14:	2301      	movs	r3, #1
 8000c16:	e000      	b.n	8000c1a <FLASH_WaitForLastOperation+0x7e>
 8000c18:	2300      	movs	r3, #0
 8000c1a:	4618      	mov	r0, r3
 8000c1c:	3710      	adds	r7, #16
 8000c1e:	46bd      	mov	sp, r7
 8000c20:	bd80      	pop	{r7, pc}
 8000c22:	bf00      	nop
 8000c24:	40022000 	.word	0x40022000

08000c28 <FLASH_SetErrorCode>:
 8000c28:	b480      	push	{r7}
 8000c2a:	b083      	sub	sp, #12
 8000c2c:	af00      	add	r7, sp, #0
 8000c2e:	2300      	movs	r3, #0
 8000c30:	607b      	str	r3, [r7, #4]
 8000c32:	4b23      	ldr	r3, [pc, #140]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000c34:	68db      	ldr	r3, [r3, #12]
 8000c36:	f003 0310 	and.w	r3, r3, #16
 8000c3a:	2b00      	cmp	r3, #0
 8000c3c:	d009      	beq.n	8000c52 <FLASH_SetErrorCode+0x2a>
 8000c3e:	4b21      	ldr	r3, [pc, #132]	; (8000cc4 <FLASH_SetErrorCode+0x9c>)
 8000c40:	69db      	ldr	r3, [r3, #28]
 8000c42:	f043 0302 	orr.w	r3, r3, #2
 8000c46:	4a1f      	ldr	r2, [pc, #124]	; (8000cc4 <FLASH_SetErrorCode+0x9c>)
 8000c48:	61d3      	str	r3, [r2, #28]
 8000c4a:	687b      	ldr	r3, [r7, #4]
 8000c4c:	f043 0310 	orr.w	r3, r3, #16
 8000c50:	607b      	str	r3, [r7, #4]
 8000c52:	4b1b      	ldr	r3, [pc, #108]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000c54:	68db      	ldr	r3, [r3, #12]
 8000c56:	f003 0304 	and.w	r3, r3, #4
 8000c5a:	2b00      	cmp	r3, #0
 8000c5c:	d009      	beq.n	8000c72 <FLASH_SetErrorCode+0x4a>
 8000c5e:	4b19      	ldr	r3, [pc, #100]	; (8000cc4 <FLASH_SetErrorCode+0x9c>)
 8000c60:	69db      	ldr	r3, [r3, #28]
 8000c62:	f043 0301 	orr.w	r3, r3, #1
 8000c66:	4a17      	ldr	r2, [pc, #92]	; (8000cc4 <FLASH_SetErrorCode+0x9c>)
 8000c68:	61d3      	str	r3, [r2, #28]
 8000c6a:	687b      	ldr	r3, [r7, #4]
 8000c6c:	f043 0304 	orr.w	r3, r3, #4
 8000c70:	607b      	str	r3, [r7, #4]
 8000c72:	4b13      	ldr	r3, [pc, #76]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000c74:	69db      	ldr	r3, [r3, #28]
 8000c76:	f003 0301 	and.w	r3, r3, #1
 8000c7a:	2b00      	cmp	r3, #0
 8000c7c:	d00b      	beq.n	8000c96 <FLASH_SetErrorCode+0x6e>
 8000c7e:	4b11      	ldr	r3, [pc, #68]	; (8000cc4 <FLASH_SetErrorCode+0x9c>)
 8000c80:	69db      	ldr	r3, [r3, #28]
 8000c82:	f043 0304 	orr.w	r3, r3, #4
 8000c86:	4a0f      	ldr	r2, [pc, #60]	; (8000cc4 <FLASH_SetErrorCode+0x9c>)
 8000c88:	61d3      	str	r3, [r2, #28]
 8000c8a:	4b0d      	ldr	r3, [pc, #52]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000c8c:	69db      	ldr	r3, [r3, #28]
 8000c8e:	4a0c      	ldr	r2, [pc, #48]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000c90:	f023 0301 	bic.w	r3, r3, #1
 8000c94:	61d3      	str	r3, [r2, #28]
 8000c96:	687b      	ldr	r3, [r7, #4]
 8000c98:	f240 1201 	movw	r2, #257	; 0x101
 8000c9c:	4293      	cmp	r3, r2
 8000c9e:	d106      	bne.n	8000cae <FLASH_SetErrorCode+0x86>
 8000ca0:	4b07      	ldr	r3, [pc, #28]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000ca2:	69db      	ldr	r3, [r3, #28]
 8000ca4:	4a06      	ldr	r2, [pc, #24]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000ca6:	f023 0301 	bic.w	r3, r3, #1
 8000caa:	61d3      	str	r3, [r2, #28]
 8000cac:	e002      	b.n	8000cb4 <FLASH_SetErrorCode+0x8c>
 8000cae:	4a04      	ldr	r2, [pc, #16]	; (8000cc0 <FLASH_SetErrorCode+0x98>)
 8000cb0:	687b      	ldr	r3, [r7, #4]
 8000cb2:	60d3      	str	r3, [r2, #12]
 8000cb4:	bf00      	nop
 8000cb6:	370c      	adds	r7, #12
 8000cb8:	46bd      	mov	sp, r7
 8000cba:	bc80      	pop	{r7}
 8000cbc:	4770      	bx	lr
 8000cbe:	bf00      	nop
 8000cc0:	40022000 	.word	0x40022000
 8000cc4:	200000a0 	.word	0x200000a0

08000cc8 <HAL_FLASHEx_Erase>:
 8000cc8:	b580      	push	{r7, lr}
 8000cca:	b084      	sub	sp, #16
 8000ccc:	af00      	add	r7, sp, #0
 8000cce:	6078      	str	r0, [r7, #4]
 8000cd0:	6039      	str	r1, [r7, #0]
 8000cd2:	2301      	movs	r3, #1
 8000cd4:	73fb      	strb	r3, [r7, #15]
 8000cd6:	2300      	movs	r3, #0
 8000cd8:	60bb      	str	r3, [r7, #8]
 8000cda:	4b2f      	ldr	r3, [pc, #188]	; (8000d98 <HAL_FLASHEx_Erase+0xd0>)
 8000cdc:	7e1b      	ldrb	r3, [r3, #24]
 8000cde:	2b01      	cmp	r3, #1
 8000ce0:	d101      	bne.n	8000ce6 <HAL_FLASHEx_Erase+0x1e>
 8000ce2:	2302      	movs	r3, #2
 8000ce4:	e053      	b.n	8000d8e <HAL_FLASHEx_Erase+0xc6>
 8000ce6:	4b2c      	ldr	r3, [pc, #176]	; (8000d98 <HAL_FLASHEx_Erase+0xd0>)
 8000ce8:	2201      	movs	r2, #1
 8000cea:	761a      	strb	r2, [r3, #24]
 8000cec:	687b      	ldr	r3, [r7, #4]
 8000cee:	681b      	ldr	r3, [r3, #0]
 8000cf0:	2b02      	cmp	r3, #2
 8000cf2:	d116      	bne.n	8000d22 <HAL_FLASHEx_Erase+0x5a>
 8000cf4:	f24c 3050 	movw	r0, #50000	; 0xc350
 8000cf8:	f7ff ff50 	bl	8000b9c <FLASH_WaitForLastOperation>
 8000cfc:	4603      	mov	r3, r0
 8000cfe:	2b00      	cmp	r3, #0
 8000d00:	d141      	bne.n	8000d86 <HAL_FLASHEx_Erase+0xbe>
 8000d02:	2001      	movs	r0, #1
 8000d04:	f000 f84c 	bl	8000da0 <FLASH_MassErase>
 8000d08:	f24c 3050 	movw	r0, #50000	; 0xc350
 8000d0c:	f7ff ff46 	bl	8000b9c <FLASH_WaitForLastOperation>
 8000d10:	4603      	mov	r3, r0
 8000d12:	73fb      	strb	r3, [r7, #15]
 8000d14:	4b21      	ldr	r3, [pc, #132]	; (8000d9c <HAL_FLASHEx_Erase+0xd4>)
 8000d16:	691b      	ldr	r3, [r3, #16]
 8000d18:	4a20      	ldr	r2, [pc, #128]	; (8000d9c <HAL_FLASHEx_Erase+0xd4>)
 8000d1a:	f023 0304 	bic.w	r3, r3, #4
 8000d1e:	6113      	str	r3, [r2, #16]
 8000d20:	e031      	b.n	8000d86 <HAL_FLASHEx_Erase+0xbe>
 8000d22:	f24c 3050 	movw	r0, #50000	; 0xc350
 8000d26:	f7ff ff39 	bl	8000b9c <FLASH_WaitForLastOperation>
 8000d2a:	4603      	mov	r3, r0
 8000d2c:	2b00      	cmp	r3, #0
 8000d2e:	d12a      	bne.n	8000d86 <HAL_FLASHEx_Erase+0xbe>
 8000d30:	683b      	ldr	r3, [r7, #0]
 8000d32:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8000d36:	601a      	str	r2, [r3, #0]
 8000d38:	687b      	ldr	r3, [r7, #4]
 8000d3a:	689b      	ldr	r3, [r3, #8]
 8000d3c:	60bb      	str	r3, [r7, #8]
 8000d3e:	e019      	b.n	8000d74 <HAL_FLASHEx_Erase+0xac>
 8000d40:	68b8      	ldr	r0, [r7, #8]
 8000d42:	f000 f849 	bl	8000dd8 <FLASH_PageErase>
 8000d46:	f24c 3050 	movw	r0, #50000	; 0xc350
 8000d4a:	f7ff ff27 	bl	8000b9c <FLASH_WaitForLastOperation>
 8000d4e:	4603      	mov	r3, r0
 8000d50:	73fb      	strb	r3, [r7, #15]
 8000d52:	4b12      	ldr	r3, [pc, #72]	; (8000d9c <HAL_FLASHEx_Erase+0xd4>)
 8000d54:	691b      	ldr	r3, [r3, #16]
 8000d56:	4a11      	ldr	r2, [pc, #68]	; (8000d9c <HAL_FLASHEx_Erase+0xd4>)
 8000d58:	f023 0302 	bic.w	r3, r3, #2
 8000d5c:	6113      	str	r3, [r2, #16]
 8000d5e:	7bfb      	ldrb	r3, [r7, #15]
 8000d60:	2b00      	cmp	r3, #0
 8000d62:	d003      	beq.n	8000d6c <HAL_FLASHEx_Erase+0xa4>
 8000d64:	683b      	ldr	r3, [r7, #0]
 8000d66:	68ba      	ldr	r2, [r7, #8]
 8000d68:	601a      	str	r2, [r3, #0]
 8000d6a:	e00c      	b.n	8000d86 <HAL_FLASHEx_Erase+0xbe>
 8000d6c:	68bb      	ldr	r3, [r7, #8]
 8000d6e:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8000d72:	60bb      	str	r3, [r7, #8]
 8000d74:	687b      	ldr	r3, [r7, #4]
 8000d76:	68db      	ldr	r3, [r3, #12]
 8000d78:	02da      	lsls	r2, r3, #11
 8000d7a:	687b      	ldr	r3, [r7, #4]
 8000d7c:	689b      	ldr	r3, [r3, #8]
 8000d7e:	4413      	add	r3, r2
 8000d80:	68ba      	ldr	r2, [r7, #8]
 8000d82:	429a      	cmp	r2, r3
 8000d84:	d3dc      	bcc.n	8000d40 <HAL_FLASHEx_Erase+0x78>
 8000d86:	4b04      	ldr	r3, [pc, #16]	; (8000d98 <HAL_FLASHEx_Erase+0xd0>)
 8000d88:	2200      	movs	r2, #0
 8000d8a:	761a      	strb	r2, [r3, #24]
 8000d8c:	7bfb      	ldrb	r3, [r7, #15]
 8000d8e:	4618      	mov	r0, r3
 8000d90:	3710      	adds	r7, #16
 8000d92:	46bd      	mov	sp, r7
 8000d94:	bd80      	pop	{r7, pc}
 8000d96:	bf00      	nop
 8000d98:	200000a0 	.word	0x200000a0
 8000d9c:	40022000 	.word	0x40022000

08000da0 <FLASH_MassErase>:
 8000da0:	b480      	push	{r7}
 8000da2:	b083      	sub	sp, #12
 8000da4:	af00      	add	r7, sp, #0
 8000da6:	6078      	str	r0, [r7, #4]
 8000da8:	4b09      	ldr	r3, [pc, #36]	; (8000dd0 <FLASH_MassErase+0x30>)
 8000daa:	2200      	movs	r2, #0
 8000dac:	61da      	str	r2, [r3, #28]
 8000dae:	4b09      	ldr	r3, [pc, #36]	; (8000dd4 <FLASH_MassErase+0x34>)
 8000db0:	691b      	ldr	r3, [r3, #16]
 8000db2:	4a08      	ldr	r2, [pc, #32]	; (8000dd4 <FLASH_MassErase+0x34>)
 8000db4:	f043 0304 	orr.w	r3, r3, #4
 8000db8:	6113      	str	r3, [r2, #16]
 8000dba:	4b06      	ldr	r3, [pc, #24]	; (8000dd4 <FLASH_MassErase+0x34>)
 8000dbc:	691b      	ldr	r3, [r3, #16]
 8000dbe:	4a05      	ldr	r2, [pc, #20]	; (8000dd4 <FLASH_MassErase+0x34>)
 8000dc0:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8000dc4:	6113      	str	r3, [r2, #16]
 8000dc6:	bf00      	nop
 8000dc8:	370c      	adds	r7, #12
 8000dca:	46bd      	mov	sp, r7
 8000dcc:	bc80      	pop	{r7}
 8000dce:	4770      	bx	lr
 8000dd0:	200000a0 	.word	0x200000a0
 8000dd4:	40022000 	.word	0x40022000

08000dd8 <FLASH_PageErase>:
 8000dd8:	b480      	push	{r7}
 8000dda:	b083      	sub	sp, #12
 8000ddc:	af00      	add	r7, sp, #0
 8000dde:	6078      	str	r0, [r7, #4]
 8000de0:	4b0b      	ldr	r3, [pc, #44]	; (8000e10 <FLASH_PageErase+0x38>)
 8000de2:	2200      	movs	r2, #0
 8000de4:	61da      	str	r2, [r3, #28]
 8000de6:	4b0b      	ldr	r3, [pc, #44]	; (8000e14 <FLASH_PageErase+0x3c>)
 8000de8:	691b      	ldr	r3, [r3, #16]
 8000dea:	4a0a      	ldr	r2, [pc, #40]	; (8000e14 <FLASH_PageErase+0x3c>)
 8000dec:	f043 0302 	orr.w	r3, r3, #2
 8000df0:	6113      	str	r3, [r2, #16]
 8000df2:	4a08      	ldr	r2, [pc, #32]	; (8000e14 <FLASH_PageErase+0x3c>)
 8000df4:	687b      	ldr	r3, [r7, #4]
 8000df6:	6153      	str	r3, [r2, #20]
 8000df8:	4b06      	ldr	r3, [pc, #24]	; (8000e14 <FLASH_PageErase+0x3c>)
 8000dfa:	691b      	ldr	r3, [r3, #16]
 8000dfc:	4a05      	ldr	r2, [pc, #20]	; (8000e14 <FLASH_PageErase+0x3c>)
 8000dfe:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8000e02:	6113      	str	r3, [r2, #16]
 8000e04:	bf00      	nop
 8000e06:	370c      	adds	r7, #12
 8000e08:	46bd      	mov	sp, r7
 8000e0a:	bc80      	pop	{r7}
 8000e0c:	4770      	bx	lr
 8000e0e:	bf00      	nop
 8000e10:	200000a0 	.word	0x200000a0
 8000e14:	40022000 	.word	0x40022000

08000e18 <HAL_GPIO_Init>:
 8000e18:	b480      	push	{r7}
 8000e1a:	b08b      	sub	sp, #44	; 0x2c
 8000e1c:	af00      	add	r7, sp, #0
 8000e1e:	6078      	str	r0, [r7, #4]
 8000e20:	6039      	str	r1, [r7, #0]
 8000e22:	2300      	movs	r3, #0
 8000e24:	627b      	str	r3, [r7, #36]	; 0x24
 8000e26:	2300      	movs	r3, #0
 8000e28:	623b      	str	r3, [r7, #32]
 8000e2a:	e179      	b.n	8001120 <HAL_GPIO_Init+0x308>
 8000e2c:	2201      	movs	r2, #1
 8000e2e:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000e30:	fa02 f303 	lsl.w	r3, r2, r3
 8000e34:	61fb      	str	r3, [r7, #28]
 8000e36:	683b      	ldr	r3, [r7, #0]
 8000e38:	681b      	ldr	r3, [r3, #0]
 8000e3a:	69fa      	ldr	r2, [r7, #28]
 8000e3c:	4013      	ands	r3, r2
 8000e3e:	61bb      	str	r3, [r7, #24]
 8000e40:	69ba      	ldr	r2, [r7, #24]
 8000e42:	69fb      	ldr	r3, [r7, #28]
 8000e44:	429a      	cmp	r2, r3
 8000e46:	f040 8168 	bne.w	800111a <HAL_GPIO_Init+0x302>
 8000e4a:	683b      	ldr	r3, [r7, #0]
 8000e4c:	685b      	ldr	r3, [r3, #4]
 8000e4e:	4a96      	ldr	r2, [pc, #600]	; (80010a8 <HAL_GPIO_Init+0x290>)
 8000e50:	4293      	cmp	r3, r2
 8000e52:	d05e      	beq.n	8000f12 <HAL_GPIO_Init+0xfa>
 8000e54:	4a94      	ldr	r2, [pc, #592]	; (80010a8 <HAL_GPIO_Init+0x290>)
 8000e56:	4293      	cmp	r3, r2
 8000e58:	d875      	bhi.n	8000f46 <HAL_GPIO_Init+0x12e>
 8000e5a:	4a94      	ldr	r2, [pc, #592]	; (80010ac <HAL_GPIO_Init+0x294>)
 8000e5c:	4293      	cmp	r3, r2
 8000e5e:	d058      	beq.n	8000f12 <HAL_GPIO_Init+0xfa>
 8000e60:	4a92      	ldr	r2, [pc, #584]	; (80010ac <HAL_GPIO_Init+0x294>)
 8000e62:	4293      	cmp	r3, r2
 8000e64:	d86f      	bhi.n	8000f46 <HAL_GPIO_Init+0x12e>
 8000e66:	4a92      	ldr	r2, [pc, #584]	; (80010b0 <HAL_GPIO_Init+0x298>)
 8000e68:	4293      	cmp	r3, r2
 8000e6a:	d052      	beq.n	8000f12 <HAL_GPIO_Init+0xfa>
 8000e6c:	4a90      	ldr	r2, [pc, #576]	; (80010b0 <HAL_GPIO_Init+0x298>)
 8000e6e:	4293      	cmp	r3, r2
 8000e70:	d869      	bhi.n	8000f46 <HAL_GPIO_Init+0x12e>
 8000e72:	4a90      	ldr	r2, [pc, #576]	; (80010b4 <HAL_GPIO_Init+0x29c>)
 8000e74:	4293      	cmp	r3, r2
 8000e76:	d04c      	beq.n	8000f12 <HAL_GPIO_Init+0xfa>
 8000e78:	4a8e      	ldr	r2, [pc, #568]	; (80010b4 <HAL_GPIO_Init+0x29c>)
 8000e7a:	4293      	cmp	r3, r2
 8000e7c:	d863      	bhi.n	8000f46 <HAL_GPIO_Init+0x12e>
 8000e7e:	4a8e      	ldr	r2, [pc, #568]	; (80010b8 <HAL_GPIO_Init+0x2a0>)
 8000e80:	4293      	cmp	r3, r2
 8000e82:	d046      	beq.n	8000f12 <HAL_GPIO_Init+0xfa>
 8000e84:	4a8c      	ldr	r2, [pc, #560]	; (80010b8 <HAL_GPIO_Init+0x2a0>)
 8000e86:	4293      	cmp	r3, r2
 8000e88:	d85d      	bhi.n	8000f46 <HAL_GPIO_Init+0x12e>
 8000e8a:	2b12      	cmp	r3, #18
 8000e8c:	d82a      	bhi.n	8000ee4 <HAL_GPIO_Init+0xcc>
 8000e8e:	2b12      	cmp	r3, #18
 8000e90:	d859      	bhi.n	8000f46 <HAL_GPIO_Init+0x12e>
 8000e92:	a201      	add	r2, pc, #4	; (adr r2, 8000e98 <HAL_GPIO_Init+0x80>)
 8000e94:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
 8000e98:	08000f13 	.word	0x08000f13
 8000e9c:	08000eed 	.word	0x08000eed
 8000ea0:	08000eff 	.word	0x08000eff
 8000ea4:	08000f41 	.word	0x08000f41
 8000ea8:	08000f47 	.word	0x08000f47
 8000eac:	08000f47 	.word	0x08000f47
 8000eb0:	08000f47 	.word	0x08000f47
 8000eb4:	08000f47 	.word	0x08000f47
 8000eb8:	08000f47 	.word	0x08000f47
 8000ebc:	08000f47 	.word	0x08000f47
 8000ec0:	08000f47 	.word	0x08000f47
 8000ec4:	08000f47 	.word	0x08000f47
 8000ec8:	08000f47 	.word	0x08000f47
 8000ecc:	08000f47 	.word	0x08000f47
 8000ed0:	08000f47 	.word	0x08000f47
 8000ed4:	08000f47 	.word	0x08000f47
 8000ed8:	08000f47 	.word	0x08000f47
 8000edc:	08000ef5 	.word	0x08000ef5
 8000ee0:	08000f09 	.word	0x08000f09
 8000ee4:	4a75      	ldr	r2, [pc, #468]	; (80010bc <HAL_GPIO_Init+0x2a4>)
 8000ee6:	4293      	cmp	r3, r2
 8000ee8:	d013      	beq.n	8000f12 <HAL_GPIO_Init+0xfa>
 8000eea:	e02c      	b.n	8000f46 <HAL_GPIO_Init+0x12e>
 8000eec:	683b      	ldr	r3, [r7, #0]
 8000eee:	68db      	ldr	r3, [r3, #12]
 8000ef0:	623b      	str	r3, [r7, #32]
 8000ef2:	e029      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000ef4:	683b      	ldr	r3, [r7, #0]
 8000ef6:	68db      	ldr	r3, [r3, #12]
 8000ef8:	3304      	adds	r3, #4
 8000efa:	623b      	str	r3, [r7, #32]
 8000efc:	e024      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000efe:	683b      	ldr	r3, [r7, #0]
 8000f00:	68db      	ldr	r3, [r3, #12]
 8000f02:	3308      	adds	r3, #8
 8000f04:	623b      	str	r3, [r7, #32]
 8000f06:	e01f      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000f08:	683b      	ldr	r3, [r7, #0]
 8000f0a:	68db      	ldr	r3, [r3, #12]
 8000f0c:	330c      	adds	r3, #12
 8000f0e:	623b      	str	r3, [r7, #32]
 8000f10:	e01a      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000f12:	683b      	ldr	r3, [r7, #0]
 8000f14:	689b      	ldr	r3, [r3, #8]
 8000f16:	2b00      	cmp	r3, #0
 8000f18:	d102      	bne.n	8000f20 <HAL_GPIO_Init+0x108>
 8000f1a:	2304      	movs	r3, #4
 8000f1c:	623b      	str	r3, [r7, #32]
 8000f1e:	e013      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000f20:	683b      	ldr	r3, [r7, #0]
 8000f22:	689b      	ldr	r3, [r3, #8]
 8000f24:	2b01      	cmp	r3, #1
 8000f26:	d105      	bne.n	8000f34 <HAL_GPIO_Init+0x11c>
 8000f28:	2308      	movs	r3, #8
 8000f2a:	623b      	str	r3, [r7, #32]
 8000f2c:	687b      	ldr	r3, [r7, #4]
 8000f2e:	69fa      	ldr	r2, [r7, #28]
 8000f30:	611a      	str	r2, [r3, #16]
 8000f32:	e009      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000f34:	2308      	movs	r3, #8
 8000f36:	623b      	str	r3, [r7, #32]
 8000f38:	687b      	ldr	r3, [r7, #4]
 8000f3a:	69fa      	ldr	r2, [r7, #28]
 8000f3c:	615a      	str	r2, [r3, #20]
 8000f3e:	e003      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000f40:	2300      	movs	r3, #0
 8000f42:	623b      	str	r3, [r7, #32]
 8000f44:	e000      	b.n	8000f48 <HAL_GPIO_Init+0x130>
 8000f46:	bf00      	nop
 8000f48:	69bb      	ldr	r3, [r7, #24]
 8000f4a:	2bff      	cmp	r3, #255	; 0xff
 8000f4c:	d801      	bhi.n	8000f52 <HAL_GPIO_Init+0x13a>
 8000f4e:	687b      	ldr	r3, [r7, #4]
 8000f50:	e001      	b.n	8000f56 <HAL_GPIO_Init+0x13e>
 8000f52:	687b      	ldr	r3, [r7, #4]
 8000f54:	3304      	adds	r3, #4
 8000f56:	617b      	str	r3, [r7, #20]
 8000f58:	69bb      	ldr	r3, [r7, #24]
 8000f5a:	2bff      	cmp	r3, #255	; 0xff
 8000f5c:	d802      	bhi.n	8000f64 <HAL_GPIO_Init+0x14c>
 8000f5e:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000f60:	009b      	lsls	r3, r3, #2
 8000f62:	e002      	b.n	8000f6a <HAL_GPIO_Init+0x152>
 8000f64:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000f66:	3b08      	subs	r3, #8
 8000f68:	009b      	lsls	r3, r3, #2
 8000f6a:	613b      	str	r3, [r7, #16]
 8000f6c:	697b      	ldr	r3, [r7, #20]
 8000f6e:	681a      	ldr	r2, [r3, #0]
 8000f70:	210f      	movs	r1, #15
 8000f72:	693b      	ldr	r3, [r7, #16]
 8000f74:	fa01 f303 	lsl.w	r3, r1, r3
 8000f78:	43db      	mvns	r3, r3
 8000f7a:	401a      	ands	r2, r3
 8000f7c:	6a39      	ldr	r1, [r7, #32]
 8000f7e:	693b      	ldr	r3, [r7, #16]
 8000f80:	fa01 f303 	lsl.w	r3, r1, r3
 8000f84:	431a      	orrs	r2, r3
 8000f86:	697b      	ldr	r3, [r7, #20]
 8000f88:	601a      	str	r2, [r3, #0]
 8000f8a:	683b      	ldr	r3, [r7, #0]
 8000f8c:	685b      	ldr	r3, [r3, #4]
 8000f8e:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 8000f92:	2b00      	cmp	r3, #0
 8000f94:	f000 80c1 	beq.w	800111a <HAL_GPIO_Init+0x302>
 8000f98:	4b49      	ldr	r3, [pc, #292]	; (80010c0 <HAL_GPIO_Init+0x2a8>)
 8000f9a:	699b      	ldr	r3, [r3, #24]
 8000f9c:	4a48      	ldr	r2, [pc, #288]	; (80010c0 <HAL_GPIO_Init+0x2a8>)
 8000f9e:	f043 0301 	orr.w	r3, r3, #1
 8000fa2:	6193      	str	r3, [r2, #24]
 8000fa4:	4b46      	ldr	r3, [pc, #280]	; (80010c0 <HAL_GPIO_Init+0x2a8>)
 8000fa6:	699b      	ldr	r3, [r3, #24]
 8000fa8:	f003 0301 	and.w	r3, r3, #1
 8000fac:	60bb      	str	r3, [r7, #8]
 8000fae:	68bb      	ldr	r3, [r7, #8]
 8000fb0:	4a44      	ldr	r2, [pc, #272]	; (80010c4 <HAL_GPIO_Init+0x2ac>)
 8000fb2:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000fb4:	089b      	lsrs	r3, r3, #2
 8000fb6:	3302      	adds	r3, #2
 8000fb8:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
 8000fbc:	60fb      	str	r3, [r7, #12]
 8000fbe:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8000fc0:	f003 0303 	and.w	r3, r3, #3
 8000fc4:	009b      	lsls	r3, r3, #2
 8000fc6:	220f      	movs	r2, #15
 8000fc8:	fa02 f303 	lsl.w	r3, r2, r3
 8000fcc:	43db      	mvns	r3, r3
 8000fce:	68fa      	ldr	r2, [r7, #12]
 8000fd0:	4013      	ands	r3, r2
 8000fd2:	60fb      	str	r3, [r7, #12]
 8000fd4:	687b      	ldr	r3, [r7, #4]
 8000fd6:	4a3c      	ldr	r2, [pc, #240]	; (80010c8 <HAL_GPIO_Init+0x2b0>)
 8000fd8:	4293      	cmp	r3, r2
 8000fda:	d01f      	beq.n	800101c <HAL_GPIO_Init+0x204>
 8000fdc:	687b      	ldr	r3, [r7, #4]
 8000fde:	4a3b      	ldr	r2, [pc, #236]	; (80010cc <HAL_GPIO_Init+0x2b4>)
 8000fe0:	4293      	cmp	r3, r2
 8000fe2:	d019      	beq.n	8001018 <HAL_GPIO_Init+0x200>
 8000fe4:	687b      	ldr	r3, [r7, #4]
 8000fe6:	4a3a      	ldr	r2, [pc, #232]	; (80010d0 <HAL_GPIO_Init+0x2b8>)
 8000fe8:	4293      	cmp	r3, r2
 8000fea:	d013      	beq.n	8001014 <HAL_GPIO_Init+0x1fc>
 8000fec:	687b      	ldr	r3, [r7, #4]
 8000fee:	4a39      	ldr	r2, [pc, #228]	; (80010d4 <HAL_GPIO_Init+0x2bc>)
 8000ff0:	4293      	cmp	r3, r2
 8000ff2:	d00d      	beq.n	8001010 <HAL_GPIO_Init+0x1f8>
 8000ff4:	687b      	ldr	r3, [r7, #4]
 8000ff6:	4a38      	ldr	r2, [pc, #224]	; (80010d8 <HAL_GPIO_Init+0x2c0>)
 8000ff8:	4293      	cmp	r3, r2
 8000ffa:	d007      	beq.n	800100c <HAL_GPIO_Init+0x1f4>
 8000ffc:	687b      	ldr	r3, [r7, #4]
 8000ffe:	4a37      	ldr	r2, [pc, #220]	; (80010dc <HAL_GPIO_Init+0x2c4>)
 8001000:	4293      	cmp	r3, r2
 8001002:	d101      	bne.n	8001008 <HAL_GPIO_Init+0x1f0>
 8001004:	2305      	movs	r3, #5
 8001006:	e00a      	b.n	800101e <HAL_GPIO_Init+0x206>
 8001008:	2306      	movs	r3, #6
 800100a:	e008      	b.n	800101e <HAL_GPIO_Init+0x206>
 800100c:	2304      	movs	r3, #4
 800100e:	e006      	b.n	800101e <HAL_GPIO_Init+0x206>
 8001010:	2303      	movs	r3, #3
 8001012:	e004      	b.n	800101e <HAL_GPIO_Init+0x206>
 8001014:	2302      	movs	r3, #2
 8001016:	e002      	b.n	800101e <HAL_GPIO_Init+0x206>
 8001018:	2301      	movs	r3, #1
 800101a:	e000      	b.n	800101e <HAL_GPIO_Init+0x206>
 800101c:	2300      	movs	r3, #0
 800101e:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 8001020:	f002 0203 	and.w	r2, r2, #3
 8001024:	0092      	lsls	r2, r2, #2
 8001026:	4093      	lsls	r3, r2
 8001028:	68fa      	ldr	r2, [r7, #12]
 800102a:	4313      	orrs	r3, r2
 800102c:	60fb      	str	r3, [r7, #12]
 800102e:	4925      	ldr	r1, [pc, #148]	; (80010c4 <HAL_GPIO_Init+0x2ac>)
 8001030:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8001032:	089b      	lsrs	r3, r3, #2
 8001034:	3302      	adds	r3, #2
 8001036:	68fa      	ldr	r2, [r7, #12]
 8001038:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 800103c:	683b      	ldr	r3, [r7, #0]
 800103e:	685b      	ldr	r3, [r3, #4]
 8001040:	f403 1380 	and.w	r3, r3, #1048576	; 0x100000
 8001044:	2b00      	cmp	r3, #0
 8001046:	d006      	beq.n	8001056 <HAL_GPIO_Init+0x23e>
 8001048:	4b25      	ldr	r3, [pc, #148]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 800104a:	689a      	ldr	r2, [r3, #8]
 800104c:	4924      	ldr	r1, [pc, #144]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 800104e:	69bb      	ldr	r3, [r7, #24]
 8001050:	4313      	orrs	r3, r2
 8001052:	608b      	str	r3, [r1, #8]
 8001054:	e006      	b.n	8001064 <HAL_GPIO_Init+0x24c>
 8001056:	4b22      	ldr	r3, [pc, #136]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 8001058:	689a      	ldr	r2, [r3, #8]
 800105a:	69bb      	ldr	r3, [r7, #24]
 800105c:	43db      	mvns	r3, r3
 800105e:	4920      	ldr	r1, [pc, #128]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 8001060:	4013      	ands	r3, r2
 8001062:	608b      	str	r3, [r1, #8]
 8001064:	683b      	ldr	r3, [r7, #0]
 8001066:	685b      	ldr	r3, [r3, #4]
 8001068:	f403 1300 	and.w	r3, r3, #2097152	; 0x200000
 800106c:	2b00      	cmp	r3, #0
 800106e:	d006      	beq.n	800107e <HAL_GPIO_Init+0x266>
 8001070:	4b1b      	ldr	r3, [pc, #108]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 8001072:	68da      	ldr	r2, [r3, #12]
 8001074:	491a      	ldr	r1, [pc, #104]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 8001076:	69bb      	ldr	r3, [r7, #24]
 8001078:	4313      	orrs	r3, r2
 800107a:	60cb      	str	r3, [r1, #12]
 800107c:	e006      	b.n	800108c <HAL_GPIO_Init+0x274>
 800107e:	4b18      	ldr	r3, [pc, #96]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 8001080:	68da      	ldr	r2, [r3, #12]
 8001082:	69bb      	ldr	r3, [r7, #24]
 8001084:	43db      	mvns	r3, r3
 8001086:	4916      	ldr	r1, [pc, #88]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 8001088:	4013      	ands	r3, r2
 800108a:	60cb      	str	r3, [r1, #12]
 800108c:	683b      	ldr	r3, [r7, #0]
 800108e:	685b      	ldr	r3, [r3, #4]
 8001090:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 8001094:	2b00      	cmp	r3, #0
 8001096:	d025      	beq.n	80010e4 <HAL_GPIO_Init+0x2cc>
 8001098:	4b11      	ldr	r3, [pc, #68]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 800109a:	685a      	ldr	r2, [r3, #4]
 800109c:	4910      	ldr	r1, [pc, #64]	; (80010e0 <HAL_GPIO_Init+0x2c8>)
 800109e:	69bb      	ldr	r3, [r7, #24]
 80010a0:	4313      	orrs	r3, r2
 80010a2:	604b      	str	r3, [r1, #4]
 80010a4:	e025      	b.n	80010f2 <HAL_GPIO_Init+0x2da>
 80010a6:	bf00      	nop
 80010a8:	10320000 	.word	0x10320000
 80010ac:	10310000 	.word	0x10310000
 80010b0:	10220000 	.word	0x10220000
 80010b4:	10210000 	.word	0x10210000
 80010b8:	10120000 	.word	0x10120000
 80010bc:	10110000 	.word	0x10110000
 80010c0:	40021000 	.word	0x40021000
 80010c4:	40010000 	.word	0x40010000
 80010c8:	40010800 	.word	0x40010800
 80010cc:	40010c00 	.word	0x40010c00
 80010d0:	40011000 	.word	0x40011000
 80010d4:	40011400 	.word	0x40011400
 80010d8:	40011800 	.word	0x40011800
 80010dc:	40011c00 	.word	0x40011c00
 80010e0:	40010400 	.word	0x40010400
 80010e4:	4b15      	ldr	r3, [pc, #84]	; (800113c <HAL_GPIO_Init+0x324>)
 80010e6:	685a      	ldr	r2, [r3, #4]
 80010e8:	69bb      	ldr	r3, [r7, #24]
 80010ea:	43db      	mvns	r3, r3
 80010ec:	4913      	ldr	r1, [pc, #76]	; (800113c <HAL_GPIO_Init+0x324>)
 80010ee:	4013      	ands	r3, r2
 80010f0:	604b      	str	r3, [r1, #4]
 80010f2:	683b      	ldr	r3, [r7, #0]
 80010f4:	685b      	ldr	r3, [r3, #4]
 80010f6:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 80010fa:	2b00      	cmp	r3, #0
 80010fc:	d006      	beq.n	800110c <HAL_GPIO_Init+0x2f4>
 80010fe:	4b0f      	ldr	r3, [pc, #60]	; (800113c <HAL_GPIO_Init+0x324>)
 8001100:	681a      	ldr	r2, [r3, #0]
 8001102:	490e      	ldr	r1, [pc, #56]	; (800113c <HAL_GPIO_Init+0x324>)
 8001104:	69bb      	ldr	r3, [r7, #24]
 8001106:	4313      	orrs	r3, r2
 8001108:	600b      	str	r3, [r1, #0]
 800110a:	e006      	b.n	800111a <HAL_GPIO_Init+0x302>
 800110c:	4b0b      	ldr	r3, [pc, #44]	; (800113c <HAL_GPIO_Init+0x324>)
 800110e:	681a      	ldr	r2, [r3, #0]
 8001110:	69bb      	ldr	r3, [r7, #24]
 8001112:	43db      	mvns	r3, r3
 8001114:	4909      	ldr	r1, [pc, #36]	; (800113c <HAL_GPIO_Init+0x324>)
 8001116:	4013      	ands	r3, r2
 8001118:	600b      	str	r3, [r1, #0]
 800111a:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800111c:	3301      	adds	r3, #1
 800111e:	627b      	str	r3, [r7, #36]	; 0x24
 8001120:	683b      	ldr	r3, [r7, #0]
 8001122:	681a      	ldr	r2, [r3, #0]
 8001124:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8001126:	fa22 f303 	lsr.w	r3, r2, r3
 800112a:	2b00      	cmp	r3, #0
 800112c:	f47f ae7e 	bne.w	8000e2c <HAL_GPIO_Init+0x14>
 8001130:	bf00      	nop
 8001132:	bf00      	nop
 8001134:	372c      	adds	r7, #44	; 0x2c
 8001136:	46bd      	mov	sp, r7
 8001138:	bc80      	pop	{r7}
 800113a:	4770      	bx	lr
 800113c:	40010400 	.word	0x40010400

08001140 <HAL_GPIO_DeInit>:
 8001140:	b480      	push	{r7}
 8001142:	b089      	sub	sp, #36	; 0x24
 8001144:	af00      	add	r7, sp, #0
 8001146:	6078      	str	r0, [r7, #4]
 8001148:	6039      	str	r1, [r7, #0]
 800114a:	2300      	movs	r3, #0
 800114c:	61fb      	str	r3, [r7, #28]
 800114e:	e0a6      	b.n	800129e <HAL_GPIO_DeInit+0x15e>
 8001150:	2201      	movs	r2, #1
 8001152:	69fb      	ldr	r3, [r7, #28]
 8001154:	fa02 f303 	lsl.w	r3, r2, r3
 8001158:	683a      	ldr	r2, [r7, #0]
 800115a:	4013      	ands	r3, r2
 800115c:	61bb      	str	r3, [r7, #24]
 800115e:	69bb      	ldr	r3, [r7, #24]
 8001160:	2b00      	cmp	r3, #0
 8001162:	f000 8099 	beq.w	8001298 <HAL_GPIO_DeInit+0x158>
 8001166:	4a54      	ldr	r2, [pc, #336]	; (80012b8 <HAL_GPIO_DeInit+0x178>)
 8001168:	69fb      	ldr	r3, [r7, #28]
 800116a:	089b      	lsrs	r3, r3, #2
 800116c:	3302      	adds	r3, #2
 800116e:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
 8001172:	617b      	str	r3, [r7, #20]
 8001174:	69fb      	ldr	r3, [r7, #28]
 8001176:	f003 0303 	and.w	r3, r3, #3
 800117a:	009b      	lsls	r3, r3, #2
 800117c:	220f      	movs	r2, #15
 800117e:	fa02 f303 	lsl.w	r3, r2, r3
 8001182:	697a      	ldr	r2, [r7, #20]
 8001184:	4013      	ands	r3, r2
 8001186:	617b      	str	r3, [r7, #20]
 8001188:	687b      	ldr	r3, [r7, #4]
 800118a:	4a4c      	ldr	r2, [pc, #304]	; (80012bc <HAL_GPIO_DeInit+0x17c>)
 800118c:	4293      	cmp	r3, r2
 800118e:	d01f      	beq.n	80011d0 <HAL_GPIO_DeInit+0x90>
 8001190:	687b      	ldr	r3, [r7, #4]
 8001192:	4a4b      	ldr	r2, [pc, #300]	; (80012c0 <HAL_GPIO_DeInit+0x180>)
 8001194:	4293      	cmp	r3, r2
 8001196:	d019      	beq.n	80011cc <HAL_GPIO_DeInit+0x8c>
 8001198:	687b      	ldr	r3, [r7, #4]
 800119a:	4a4a      	ldr	r2, [pc, #296]	; (80012c4 <HAL_GPIO_DeInit+0x184>)
 800119c:	4293      	cmp	r3, r2
 800119e:	d013      	beq.n	80011c8 <HAL_GPIO_DeInit+0x88>
 80011a0:	687b      	ldr	r3, [r7, #4]
 80011a2:	4a49      	ldr	r2, [pc, #292]	; (80012c8 <HAL_GPIO_DeInit+0x188>)
 80011a4:	4293      	cmp	r3, r2
 80011a6:	d00d      	beq.n	80011c4 <HAL_GPIO_DeInit+0x84>
 80011a8:	687b      	ldr	r3, [r7, #4]
 80011aa:	4a48      	ldr	r2, [pc, #288]	; (80012cc <HAL_GPIO_DeInit+0x18c>)
 80011ac:	4293      	cmp	r3, r2
 80011ae:	d007      	beq.n	80011c0 <HAL_GPIO_DeInit+0x80>
 80011b0:	687b      	ldr	r3, [r7, #4]
 80011b2:	4a47      	ldr	r2, [pc, #284]	; (80012d0 <HAL_GPIO_DeInit+0x190>)
 80011b4:	4293      	cmp	r3, r2
 80011b6:	d101      	bne.n	80011bc <HAL_GPIO_DeInit+0x7c>
 80011b8:	2305      	movs	r3, #5
 80011ba:	e00a      	b.n	80011d2 <HAL_GPIO_DeInit+0x92>
 80011bc:	2306      	movs	r3, #6
 80011be:	e008      	b.n	80011d2 <HAL_GPIO_DeInit+0x92>
 80011c0:	2304      	movs	r3, #4
 80011c2:	e006      	b.n	80011d2 <HAL_GPIO_DeInit+0x92>
 80011c4:	2303      	movs	r3, #3
 80011c6:	e004      	b.n	80011d2 <HAL_GPIO_DeInit+0x92>
 80011c8:	2302      	movs	r3, #2
 80011ca:	e002      	b.n	80011d2 <HAL_GPIO_DeInit+0x92>
 80011cc:	2301      	movs	r3, #1
 80011ce:	e000      	b.n	80011d2 <HAL_GPIO_DeInit+0x92>
 80011d0:	2300      	movs	r3, #0
 80011d2:	69fa      	ldr	r2, [r7, #28]
 80011d4:	f002 0203 	and.w	r2, r2, #3
 80011d8:	0092      	lsls	r2, r2, #2
 80011da:	4093      	lsls	r3, r2
 80011dc:	697a      	ldr	r2, [r7, #20]
 80011de:	429a      	cmp	r2, r3
 80011e0:	d132      	bne.n	8001248 <HAL_GPIO_DeInit+0x108>
 80011e2:	4b3c      	ldr	r3, [pc, #240]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 80011e4:	681a      	ldr	r2, [r3, #0]
 80011e6:	69bb      	ldr	r3, [r7, #24]
 80011e8:	43db      	mvns	r3, r3
 80011ea:	493a      	ldr	r1, [pc, #232]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 80011ec:	4013      	ands	r3, r2
 80011ee:	600b      	str	r3, [r1, #0]
 80011f0:	4b38      	ldr	r3, [pc, #224]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 80011f2:	685a      	ldr	r2, [r3, #4]
 80011f4:	69bb      	ldr	r3, [r7, #24]
 80011f6:	43db      	mvns	r3, r3
 80011f8:	4936      	ldr	r1, [pc, #216]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 80011fa:	4013      	ands	r3, r2
 80011fc:	604b      	str	r3, [r1, #4]
 80011fe:	4b35      	ldr	r3, [pc, #212]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 8001200:	68da      	ldr	r2, [r3, #12]
 8001202:	69bb      	ldr	r3, [r7, #24]
 8001204:	43db      	mvns	r3, r3
 8001206:	4933      	ldr	r1, [pc, #204]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 8001208:	4013      	ands	r3, r2
 800120a:	60cb      	str	r3, [r1, #12]
 800120c:	4b31      	ldr	r3, [pc, #196]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 800120e:	689a      	ldr	r2, [r3, #8]
 8001210:	69bb      	ldr	r3, [r7, #24]
 8001212:	43db      	mvns	r3, r3
 8001214:	492f      	ldr	r1, [pc, #188]	; (80012d4 <HAL_GPIO_DeInit+0x194>)
 8001216:	4013      	ands	r3, r2
 8001218:	608b      	str	r3, [r1, #8]
 800121a:	69fb      	ldr	r3, [r7, #28]
 800121c:	f003 0303 	and.w	r3, r3, #3
 8001220:	009b      	lsls	r3, r3, #2
 8001222:	220f      	movs	r2, #15
 8001224:	fa02 f303 	lsl.w	r3, r2, r3
 8001228:	617b      	str	r3, [r7, #20]
 800122a:	4a23      	ldr	r2, [pc, #140]	; (80012b8 <HAL_GPIO_DeInit+0x178>)
 800122c:	69fb      	ldr	r3, [r7, #28]
 800122e:	089b      	lsrs	r3, r3, #2
 8001230:	3302      	adds	r3, #2
 8001232:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
 8001236:	697b      	ldr	r3, [r7, #20]
 8001238:	43da      	mvns	r2, r3
 800123a:	481f      	ldr	r0, [pc, #124]	; (80012b8 <HAL_GPIO_DeInit+0x178>)
 800123c:	69fb      	ldr	r3, [r7, #28]
 800123e:	089b      	lsrs	r3, r3, #2
 8001240:	400a      	ands	r2, r1
 8001242:	3302      	adds	r3, #2
 8001244:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
 8001248:	69bb      	ldr	r3, [r7, #24]
 800124a:	2bff      	cmp	r3, #255	; 0xff
 800124c:	d801      	bhi.n	8001252 <HAL_GPIO_DeInit+0x112>
 800124e:	687b      	ldr	r3, [r7, #4]
 8001250:	e001      	b.n	8001256 <HAL_GPIO_DeInit+0x116>
 8001252:	687b      	ldr	r3, [r7, #4]
 8001254:	3304      	adds	r3, #4
 8001256:	613b      	str	r3, [r7, #16]
 8001258:	69bb      	ldr	r3, [r7, #24]
 800125a:	2bff      	cmp	r3, #255	; 0xff
 800125c:	d802      	bhi.n	8001264 <HAL_GPIO_DeInit+0x124>
 800125e:	69fb      	ldr	r3, [r7, #28]
 8001260:	009b      	lsls	r3, r3, #2
 8001262:	e002      	b.n	800126a <HAL_GPIO_DeInit+0x12a>
 8001264:	69fb      	ldr	r3, [r7, #28]
 8001266:	3b08      	subs	r3, #8
 8001268:	009b      	lsls	r3, r3, #2
 800126a:	60fb      	str	r3, [r7, #12]
 800126c:	693b      	ldr	r3, [r7, #16]
 800126e:	681a      	ldr	r2, [r3, #0]
 8001270:	210f      	movs	r1, #15
 8001272:	68fb      	ldr	r3, [r7, #12]
 8001274:	fa01 f303 	lsl.w	r3, r1, r3
 8001278:	43db      	mvns	r3, r3
 800127a:	401a      	ands	r2, r3
 800127c:	2104      	movs	r1, #4
 800127e:	68fb      	ldr	r3, [r7, #12]
 8001280:	fa01 f303 	lsl.w	r3, r1, r3
 8001284:	431a      	orrs	r2, r3
 8001286:	693b      	ldr	r3, [r7, #16]
 8001288:	601a      	str	r2, [r3, #0]
 800128a:	687b      	ldr	r3, [r7, #4]
 800128c:	68da      	ldr	r2, [r3, #12]
 800128e:	69bb      	ldr	r3, [r7, #24]
 8001290:	43db      	mvns	r3, r3
 8001292:	401a      	ands	r2, r3
 8001294:	687b      	ldr	r3, [r7, #4]
 8001296:	60da      	str	r2, [r3, #12]
 8001298:	69fb      	ldr	r3, [r7, #28]
 800129a:	3301      	adds	r3, #1
 800129c:	61fb      	str	r3, [r7, #28]
 800129e:	683a      	ldr	r2, [r7, #0]
 80012a0:	69fb      	ldr	r3, [r7, #28]
 80012a2:	fa22 f303 	lsr.w	r3, r2, r3
 80012a6:	2b00      	cmp	r3, #0
 80012a8:	f47f af52 	bne.w	8001150 <HAL_GPIO_DeInit+0x10>
 80012ac:	bf00      	nop
 80012ae:	bf00      	nop
 80012b0:	3724      	adds	r7, #36	; 0x24
 80012b2:	46bd      	mov	sp, r7
 80012b4:	bc80      	pop	{r7}
 80012b6:	4770      	bx	lr
 80012b8:	40010000 	.word	0x40010000
 80012bc:	40010800 	.word	0x40010800
 80012c0:	40010c00 	.word	0x40010c00
 80012c4:	40011000 	.word	0x40011000
 80012c8:	40011400 	.word	0x40011400
 80012cc:	40011800 	.word	0x40011800
 80012d0:	40011c00 	.word	0x40011c00
 80012d4:	40010400 	.word	0x40010400

080012d8 <HAL_GPIO_ReadPin>:
 80012d8:	b480      	push	{r7}
 80012da:	b085      	sub	sp, #20
 80012dc:	af00      	add	r7, sp, #0
 80012de:	6078      	str	r0, [r7, #4]
 80012e0:	460b      	mov	r3, r1
 80012e2:	807b      	strh	r3, [r7, #2]
 80012e4:	687b      	ldr	r3, [r7, #4]
 80012e6:	689a      	ldr	r2, [r3, #8]
 80012e8:	887b      	ldrh	r3, [r7, #2]
 80012ea:	4013      	ands	r3, r2
 80012ec:	2b00      	cmp	r3, #0
 80012ee:	d002      	beq.n	80012f6 <HAL_GPIO_ReadPin+0x1e>
 80012f0:	2301      	movs	r3, #1
 80012f2:	73fb      	strb	r3, [r7, #15]
 80012f4:	e001      	b.n	80012fa <HAL_GPIO_ReadPin+0x22>
 80012f6:	2300      	movs	r3, #0
 80012f8:	73fb      	strb	r3, [r7, #15]
 80012fa:	7bfb      	ldrb	r3, [r7, #15]
 80012fc:	4618      	mov	r0, r3
 80012fe:	3714      	adds	r7, #20
 8001300:	46bd      	mov	sp, r7
 8001302:	bc80      	pop	{r7}
 8001304:	4770      	bx	lr

08001306 <HAL_GPIO_TogglePin>:
 8001306:	b480      	push	{r7}
 8001308:	b085      	sub	sp, #20
 800130a:	af00      	add	r7, sp, #0
 800130c:	6078      	str	r0, [r7, #4]
 800130e:	460b      	mov	r3, r1
 8001310:	807b      	strh	r3, [r7, #2]
 8001312:	687b      	ldr	r3, [r7, #4]
 8001314:	68db      	ldr	r3, [r3, #12]
 8001316:	60fb      	str	r3, [r7, #12]
 8001318:	887a      	ldrh	r2, [r7, #2]
 800131a:	68fb      	ldr	r3, [r7, #12]
 800131c:	4013      	ands	r3, r2
 800131e:	041a      	lsls	r2, r3, #16
 8001320:	68fb      	ldr	r3, [r7, #12]
 8001322:	43d9      	mvns	r1, r3
 8001324:	887b      	ldrh	r3, [r7, #2]
 8001326:	400b      	ands	r3, r1
 8001328:	431a      	orrs	r2, r3
 800132a:	687b      	ldr	r3, [r7, #4]
 800132c:	611a      	str	r2, [r3, #16]
 800132e:	bf00      	nop
 8001330:	3714      	adds	r7, #20
 8001332:	46bd      	mov	sp, r7
 8001334:	bc80      	pop	{r7}
 8001336:	4770      	bx	lr

08001338 <HAL_RCC_DeInit>:
 8001338:	b580      	push	{r7, lr}
 800133a:	b082      	sub	sp, #8
 800133c:	af00      	add	r7, sp, #0
 800133e:	f7ff f917 	bl	8000570 <HAL_GetTick>
 8001342:	6078      	str	r0, [r7, #4]
 8001344:	4b45      	ldr	r3, [pc, #276]	; (800145c <HAL_RCC_DeInit+0x124>)
 8001346:	681b      	ldr	r3, [r3, #0]
 8001348:	4a44      	ldr	r2, [pc, #272]	; (800145c <HAL_RCC_DeInit+0x124>)
 800134a:	f043 0301 	orr.w	r3, r3, #1
 800134e:	6013      	str	r3, [r2, #0]
 8001350:	e008      	b.n	8001364 <HAL_RCC_DeInit+0x2c>
 8001352:	f7ff f90d 	bl	8000570 <HAL_GetTick>
 8001356:	4602      	mov	r2, r0
 8001358:	687b      	ldr	r3, [r7, #4]
 800135a:	1ad3      	subs	r3, r2, r3
 800135c:	2b02      	cmp	r3, #2
 800135e:	d901      	bls.n	8001364 <HAL_RCC_DeInit+0x2c>
 8001360:	2303      	movs	r3, #3
 8001362:	e077      	b.n	8001454 <HAL_RCC_DeInit+0x11c>
 8001364:	4b3d      	ldr	r3, [pc, #244]	; (800145c <HAL_RCC_DeInit+0x124>)
 8001366:	681b      	ldr	r3, [r3, #0]
 8001368:	f003 0302 	and.w	r3, r3, #2
 800136c:	2b00      	cmp	r3, #0
 800136e:	d0f0      	beq.n	8001352 <HAL_RCC_DeInit+0x1a>
 8001370:	4b3a      	ldr	r3, [pc, #232]	; (800145c <HAL_RCC_DeInit+0x124>)
 8001372:	681b      	ldr	r3, [r3, #0]
 8001374:	f023 03f8 	bic.w	r3, r3, #248	; 0xf8
 8001378:	4a38      	ldr	r2, [pc, #224]	; (800145c <HAL_RCC_DeInit+0x124>)
 800137a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 800137e:	6013      	str	r3, [r2, #0]
 8001380:	f7ff f8f6 	bl	8000570 <HAL_GetTick>
 8001384:	6078      	str	r0, [r7, #4]
 8001386:	4b35      	ldr	r3, [pc, #212]	; (800145c <HAL_RCC_DeInit+0x124>)
 8001388:	2200      	movs	r2, #0
 800138a:	605a      	str	r2, [r3, #4]
 800138c:	e00a      	b.n	80013a4 <HAL_RCC_DeInit+0x6c>
 800138e:	f7ff f8ef 	bl	8000570 <HAL_GetTick>
 8001392:	4602      	mov	r2, r0
 8001394:	687b      	ldr	r3, [r7, #4]
 8001396:	1ad3      	subs	r3, r2, r3
 8001398:	f241 3288 	movw	r2, #5000	; 0x1388
 800139c:	4293      	cmp	r3, r2
 800139e:	d901      	bls.n	80013a4 <HAL_RCC_DeInit+0x6c>
 80013a0:	2303      	movs	r3, #3
 80013a2:	e057      	b.n	8001454 <HAL_RCC_DeInit+0x11c>
 80013a4:	4b2d      	ldr	r3, [pc, #180]	; (800145c <HAL_RCC_DeInit+0x124>)
 80013a6:	685b      	ldr	r3, [r3, #4]
 80013a8:	f003 030c 	and.w	r3, r3, #12
 80013ac:	2b00      	cmp	r3, #0
 80013ae:	d1ee      	bne.n	800138e <HAL_RCC_DeInit+0x56>
 80013b0:	4b2b      	ldr	r3, [pc, #172]	; (8001460 <HAL_RCC_DeInit+0x128>)
 80013b2:	4a2c      	ldr	r2, [pc, #176]	; (8001464 <HAL_RCC_DeInit+0x12c>)
 80013b4:	601a      	str	r2, [r3, #0]
 80013b6:	4b2c      	ldr	r3, [pc, #176]	; (8001468 <HAL_RCC_DeInit+0x130>)
 80013b8:	681b      	ldr	r3, [r3, #0]
 80013ba:	4618      	mov	r0, r3
 80013bc:	f7ff f8a8 	bl	8000510 <HAL_InitTick>
 80013c0:	4603      	mov	r3, r0
 80013c2:	2b00      	cmp	r3, #0
 80013c4:	d001      	beq.n	80013ca <HAL_RCC_DeInit+0x92>
 80013c6:	2301      	movs	r3, #1
 80013c8:	e044      	b.n	8001454 <HAL_RCC_DeInit+0x11c>
 80013ca:	f7ff f8d1 	bl	8000570 <HAL_GetTick>
 80013ce:	6078      	str	r0, [r7, #4]
 80013d0:	4b22      	ldr	r3, [pc, #136]	; (800145c <HAL_RCC_DeInit+0x124>)
 80013d2:	681b      	ldr	r3, [r3, #0]
 80013d4:	4a21      	ldr	r2, [pc, #132]	; (800145c <HAL_RCC_DeInit+0x124>)
 80013d6:	f023 7380 	bic.w	r3, r3, #16777216	; 0x1000000
 80013da:	6013      	str	r3, [r2, #0]
 80013dc:	e008      	b.n	80013f0 <HAL_RCC_DeInit+0xb8>
 80013de:	f7ff f8c7 	bl	8000570 <HAL_GetTick>
 80013e2:	4602      	mov	r2, r0
 80013e4:	687b      	ldr	r3, [r7, #4]
 80013e6:	1ad3      	subs	r3, r2, r3
 80013e8:	2b02      	cmp	r3, #2
 80013ea:	d901      	bls.n	80013f0 <HAL_RCC_DeInit+0xb8>
 80013ec:	2303      	movs	r3, #3
 80013ee:	e031      	b.n	8001454 <HAL_RCC_DeInit+0x11c>
 80013f0:	4b1a      	ldr	r3, [pc, #104]	; (800145c <HAL_RCC_DeInit+0x124>)
 80013f2:	681b      	ldr	r3, [r3, #0]
 80013f4:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
 80013f8:	2b00      	cmp	r3, #0
 80013fa:	d1f0      	bne.n	80013de <HAL_RCC_DeInit+0xa6>
 80013fc:	4b17      	ldr	r3, [pc, #92]	; (800145c <HAL_RCC_DeInit+0x124>)
 80013fe:	2200      	movs	r2, #0
 8001400:	605a      	str	r2, [r3, #4]
 8001402:	f7ff f8b5 	bl	8000570 <HAL_GetTick>
 8001406:	6078      	str	r0, [r7, #4]
 8001408:	4b14      	ldr	r3, [pc, #80]	; (800145c <HAL_RCC_DeInit+0x124>)
 800140a:	681b      	ldr	r3, [r3, #0]
 800140c:	4a13      	ldr	r2, [pc, #76]	; (800145c <HAL_RCC_DeInit+0x124>)
 800140e:	f423 2310 	bic.w	r3, r3, #589824	; 0x90000
 8001412:	6013      	str	r3, [r2, #0]
 8001414:	e008      	b.n	8001428 <HAL_RCC_DeInit+0xf0>
 8001416:	f7ff f8ab 	bl	8000570 <HAL_GetTick>
 800141a:	4602      	mov	r2, r0
 800141c:	687b      	ldr	r3, [r7, #4]
 800141e:	1ad3      	subs	r3, r2, r3
 8001420:	2b64      	cmp	r3, #100	; 0x64
 8001422:	d901      	bls.n	8001428 <HAL_RCC_DeInit+0xf0>
 8001424:	2303      	movs	r3, #3
 8001426:	e015      	b.n	8001454 <HAL_RCC_DeInit+0x11c>
 8001428:	4b0c      	ldr	r3, [pc, #48]	; (800145c <HAL_RCC_DeInit+0x124>)
 800142a:	681b      	ldr	r3, [r3, #0]
 800142c:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 8001430:	2b00      	cmp	r3, #0
 8001432:	d1f0      	bne.n	8001416 <HAL_RCC_DeInit+0xde>
 8001434:	4b09      	ldr	r3, [pc, #36]	; (800145c <HAL_RCC_DeInit+0x124>)
 8001436:	681b      	ldr	r3, [r3, #0]
 8001438:	4a08      	ldr	r2, [pc, #32]	; (800145c <HAL_RCC_DeInit+0x124>)
 800143a:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
 800143e:	6013      	str	r3, [r2, #0]
 8001440:	4b06      	ldr	r3, [pc, #24]	; (800145c <HAL_RCC_DeInit+0x124>)
 8001442:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8001444:	4a05      	ldr	r2, [pc, #20]	; (800145c <HAL_RCC_DeInit+0x124>)
 8001446:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
 800144a:	6253      	str	r3, [r2, #36]	; 0x24
 800144c:	4b03      	ldr	r3, [pc, #12]	; (800145c <HAL_RCC_DeInit+0x124>)
 800144e:	2200      	movs	r2, #0
 8001450:	609a      	str	r2, [r3, #8]
 8001452:	2300      	movs	r3, #0
 8001454:	4618      	mov	r0, r3
 8001456:	3708      	adds	r7, #8
 8001458:	46bd      	mov	sp, r7
 800145a:	bd80      	pop	{r7, pc}
 800145c:	40021000 	.word	0x40021000
 8001460:	20000064 	.word	0x20000064
 8001464:	007a1200 	.word	0x007a1200
 8001468:	20000068 	.word	0x20000068

0800146c <HAL_RCC_OscConfig>:
 800146c:	b580      	push	{r7, lr}
 800146e:	b086      	sub	sp, #24
 8001470:	af00      	add	r7, sp, #0
 8001472:	6078      	str	r0, [r7, #4]
 8001474:	687b      	ldr	r3, [r7, #4]
 8001476:	2b00      	cmp	r3, #0
 8001478:	d101      	bne.n	800147e <HAL_RCC_OscConfig+0x12>
 800147a:	2301      	movs	r3, #1
 800147c:	e272      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 800147e:	687b      	ldr	r3, [r7, #4]
 8001480:	681b      	ldr	r3, [r3, #0]
 8001482:	f003 0301 	and.w	r3, r3, #1
 8001486:	2b00      	cmp	r3, #0
 8001488:	f000 8087 	beq.w	800159a <HAL_RCC_OscConfig+0x12e>
 800148c:	4b92      	ldr	r3, [pc, #584]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800148e:	685b      	ldr	r3, [r3, #4]
 8001490:	f003 030c 	and.w	r3, r3, #12
 8001494:	2b04      	cmp	r3, #4
 8001496:	d00c      	beq.n	80014b2 <HAL_RCC_OscConfig+0x46>
 8001498:	4b8f      	ldr	r3, [pc, #572]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800149a:	685b      	ldr	r3, [r3, #4]
 800149c:	f003 030c 	and.w	r3, r3, #12
 80014a0:	2b08      	cmp	r3, #8
 80014a2:	d112      	bne.n	80014ca <HAL_RCC_OscConfig+0x5e>
 80014a4:	4b8c      	ldr	r3, [pc, #560]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014a6:	685b      	ldr	r3, [r3, #4]
 80014a8:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 80014ac:	f5b3 3f80 	cmp.w	r3, #65536	; 0x10000
 80014b0:	d10b      	bne.n	80014ca <HAL_RCC_OscConfig+0x5e>
 80014b2:	4b89      	ldr	r3, [pc, #548]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014b4:	681b      	ldr	r3, [r3, #0]
 80014b6:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 80014ba:	2b00      	cmp	r3, #0
 80014bc:	d06c      	beq.n	8001598 <HAL_RCC_OscConfig+0x12c>
 80014be:	687b      	ldr	r3, [r7, #4]
 80014c0:	685b      	ldr	r3, [r3, #4]
 80014c2:	2b00      	cmp	r3, #0
 80014c4:	d168      	bne.n	8001598 <HAL_RCC_OscConfig+0x12c>
 80014c6:	2301      	movs	r3, #1
 80014c8:	e24c      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 80014ca:	687b      	ldr	r3, [r7, #4]
 80014cc:	685b      	ldr	r3, [r3, #4]
 80014ce:	f5b3 3f80 	cmp.w	r3, #65536	; 0x10000
 80014d2:	d106      	bne.n	80014e2 <HAL_RCC_OscConfig+0x76>
 80014d4:	4b80      	ldr	r3, [pc, #512]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014d6:	681b      	ldr	r3, [r3, #0]
 80014d8:	4a7f      	ldr	r2, [pc, #508]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014da:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 80014de:	6013      	str	r3, [r2, #0]
 80014e0:	e02e      	b.n	8001540 <HAL_RCC_OscConfig+0xd4>
 80014e2:	687b      	ldr	r3, [r7, #4]
 80014e4:	685b      	ldr	r3, [r3, #4]
 80014e6:	2b00      	cmp	r3, #0
 80014e8:	d10c      	bne.n	8001504 <HAL_RCC_OscConfig+0x98>
 80014ea:	4b7b      	ldr	r3, [pc, #492]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014ec:	681b      	ldr	r3, [r3, #0]
 80014ee:	4a7a      	ldr	r2, [pc, #488]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014f0:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 80014f4:	6013      	str	r3, [r2, #0]
 80014f6:	4b78      	ldr	r3, [pc, #480]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014f8:	681b      	ldr	r3, [r3, #0]
 80014fa:	4a77      	ldr	r2, [pc, #476]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80014fc:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
 8001500:	6013      	str	r3, [r2, #0]
 8001502:	e01d      	b.n	8001540 <HAL_RCC_OscConfig+0xd4>
 8001504:	687b      	ldr	r3, [r7, #4]
 8001506:	685b      	ldr	r3, [r3, #4]
 8001508:	f5b3 2fa0 	cmp.w	r3, #327680	; 0x50000
 800150c:	d10c      	bne.n	8001528 <HAL_RCC_OscConfig+0xbc>
 800150e:	4b72      	ldr	r3, [pc, #456]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 8001510:	681b      	ldr	r3, [r3, #0]
 8001512:	4a71      	ldr	r2, [pc, #452]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 8001514:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
 8001518:	6013      	str	r3, [r2, #0]
 800151a:	4b6f      	ldr	r3, [pc, #444]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800151c:	681b      	ldr	r3, [r3, #0]
 800151e:	4a6e      	ldr	r2, [pc, #440]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 8001520:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 8001524:	6013      	str	r3, [r2, #0]
 8001526:	e00b      	b.n	8001540 <HAL_RCC_OscConfig+0xd4>
 8001528:	4b6b      	ldr	r3, [pc, #428]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800152a:	681b      	ldr	r3, [r3, #0]
 800152c:	4a6a      	ldr	r2, [pc, #424]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800152e:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 8001532:	6013      	str	r3, [r2, #0]
 8001534:	4b68      	ldr	r3, [pc, #416]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 8001536:	681b      	ldr	r3, [r3, #0]
 8001538:	4a67      	ldr	r2, [pc, #412]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800153a:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
 800153e:	6013      	str	r3, [r2, #0]
 8001540:	687b      	ldr	r3, [r7, #4]
 8001542:	685b      	ldr	r3, [r3, #4]
 8001544:	2b00      	cmp	r3, #0
 8001546:	d013      	beq.n	8001570 <HAL_RCC_OscConfig+0x104>
 8001548:	f7ff f812 	bl	8000570 <HAL_GetTick>
 800154c:	6138      	str	r0, [r7, #16]
 800154e:	e008      	b.n	8001562 <HAL_RCC_OscConfig+0xf6>
 8001550:	f7ff f80e 	bl	8000570 <HAL_GetTick>
 8001554:	4602      	mov	r2, r0
 8001556:	693b      	ldr	r3, [r7, #16]
 8001558:	1ad3      	subs	r3, r2, r3
 800155a:	2b64      	cmp	r3, #100	; 0x64
 800155c:	d901      	bls.n	8001562 <HAL_RCC_OscConfig+0xf6>
 800155e:	2303      	movs	r3, #3
 8001560:	e200      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001562:	4b5d      	ldr	r3, [pc, #372]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 8001564:	681b      	ldr	r3, [r3, #0]
 8001566:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 800156a:	2b00      	cmp	r3, #0
 800156c:	d0f0      	beq.n	8001550 <HAL_RCC_OscConfig+0xe4>
 800156e:	e014      	b.n	800159a <HAL_RCC_OscConfig+0x12e>
 8001570:	f7fe fffe 	bl	8000570 <HAL_GetTick>
 8001574:	6138      	str	r0, [r7, #16]
 8001576:	e008      	b.n	800158a <HAL_RCC_OscConfig+0x11e>
 8001578:	f7fe fffa 	bl	8000570 <HAL_GetTick>
 800157c:	4602      	mov	r2, r0
 800157e:	693b      	ldr	r3, [r7, #16]
 8001580:	1ad3      	subs	r3, r2, r3
 8001582:	2b64      	cmp	r3, #100	; 0x64
 8001584:	d901      	bls.n	800158a <HAL_RCC_OscConfig+0x11e>
 8001586:	2303      	movs	r3, #3
 8001588:	e1ec      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 800158a:	4b53      	ldr	r3, [pc, #332]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800158c:	681b      	ldr	r3, [r3, #0]
 800158e:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 8001592:	2b00      	cmp	r3, #0
 8001594:	d1f0      	bne.n	8001578 <HAL_RCC_OscConfig+0x10c>
 8001596:	e000      	b.n	800159a <HAL_RCC_OscConfig+0x12e>
 8001598:	bf00      	nop
 800159a:	687b      	ldr	r3, [r7, #4]
 800159c:	681b      	ldr	r3, [r3, #0]
 800159e:	f003 0302 	and.w	r3, r3, #2
 80015a2:	2b00      	cmp	r3, #0
 80015a4:	d063      	beq.n	800166e <HAL_RCC_OscConfig+0x202>
 80015a6:	4b4c      	ldr	r3, [pc, #304]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80015a8:	685b      	ldr	r3, [r3, #4]
 80015aa:	f003 030c 	and.w	r3, r3, #12
 80015ae:	2b00      	cmp	r3, #0
 80015b0:	d00b      	beq.n	80015ca <HAL_RCC_OscConfig+0x15e>
 80015b2:	4b49      	ldr	r3, [pc, #292]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80015b4:	685b      	ldr	r3, [r3, #4]
 80015b6:	f003 030c 	and.w	r3, r3, #12
 80015ba:	2b08      	cmp	r3, #8
 80015bc:	d11c      	bne.n	80015f8 <HAL_RCC_OscConfig+0x18c>
 80015be:	4b46      	ldr	r3, [pc, #280]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80015c0:	685b      	ldr	r3, [r3, #4]
 80015c2:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 80015c6:	2b00      	cmp	r3, #0
 80015c8:	d116      	bne.n	80015f8 <HAL_RCC_OscConfig+0x18c>
 80015ca:	4b43      	ldr	r3, [pc, #268]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80015cc:	681b      	ldr	r3, [r3, #0]
 80015ce:	f003 0302 	and.w	r3, r3, #2
 80015d2:	2b00      	cmp	r3, #0
 80015d4:	d005      	beq.n	80015e2 <HAL_RCC_OscConfig+0x176>
 80015d6:	687b      	ldr	r3, [r7, #4]
 80015d8:	691b      	ldr	r3, [r3, #16]
 80015da:	2b01      	cmp	r3, #1
 80015dc:	d001      	beq.n	80015e2 <HAL_RCC_OscConfig+0x176>
 80015de:	2301      	movs	r3, #1
 80015e0:	e1c0      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 80015e2:	4b3d      	ldr	r3, [pc, #244]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80015e4:	681b      	ldr	r3, [r3, #0]
 80015e6:	f023 02f8 	bic.w	r2, r3, #248	; 0xf8
 80015ea:	687b      	ldr	r3, [r7, #4]
 80015ec:	695b      	ldr	r3, [r3, #20]
 80015ee:	00db      	lsls	r3, r3, #3
 80015f0:	4939      	ldr	r1, [pc, #228]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80015f2:	4313      	orrs	r3, r2
 80015f4:	600b      	str	r3, [r1, #0]
 80015f6:	e03a      	b.n	800166e <HAL_RCC_OscConfig+0x202>
 80015f8:	687b      	ldr	r3, [r7, #4]
 80015fa:	691b      	ldr	r3, [r3, #16]
 80015fc:	2b00      	cmp	r3, #0
 80015fe:	d020      	beq.n	8001642 <HAL_RCC_OscConfig+0x1d6>
 8001600:	4b36      	ldr	r3, [pc, #216]	; (80016dc <HAL_RCC_OscConfig+0x270>)
 8001602:	2201      	movs	r2, #1
 8001604:	601a      	str	r2, [r3, #0]
 8001606:	f7fe ffb3 	bl	8000570 <HAL_GetTick>
 800160a:	6138      	str	r0, [r7, #16]
 800160c:	e008      	b.n	8001620 <HAL_RCC_OscConfig+0x1b4>
 800160e:	f7fe ffaf 	bl	8000570 <HAL_GetTick>
 8001612:	4602      	mov	r2, r0
 8001614:	693b      	ldr	r3, [r7, #16]
 8001616:	1ad3      	subs	r3, r2, r3
 8001618:	2b02      	cmp	r3, #2
 800161a:	d901      	bls.n	8001620 <HAL_RCC_OscConfig+0x1b4>
 800161c:	2303      	movs	r3, #3
 800161e:	e1a1      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001620:	4b2d      	ldr	r3, [pc, #180]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 8001622:	681b      	ldr	r3, [r3, #0]
 8001624:	f003 0302 	and.w	r3, r3, #2
 8001628:	2b00      	cmp	r3, #0
 800162a:	d0f0      	beq.n	800160e <HAL_RCC_OscConfig+0x1a2>
 800162c:	4b2a      	ldr	r3, [pc, #168]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800162e:	681b      	ldr	r3, [r3, #0]
 8001630:	f023 02f8 	bic.w	r2, r3, #248	; 0xf8
 8001634:	687b      	ldr	r3, [r7, #4]
 8001636:	695b      	ldr	r3, [r3, #20]
 8001638:	00db      	lsls	r3, r3, #3
 800163a:	4927      	ldr	r1, [pc, #156]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 800163c:	4313      	orrs	r3, r2
 800163e:	600b      	str	r3, [r1, #0]
 8001640:	e015      	b.n	800166e <HAL_RCC_OscConfig+0x202>
 8001642:	4b26      	ldr	r3, [pc, #152]	; (80016dc <HAL_RCC_OscConfig+0x270>)
 8001644:	2200      	movs	r2, #0
 8001646:	601a      	str	r2, [r3, #0]
 8001648:	f7fe ff92 	bl	8000570 <HAL_GetTick>
 800164c:	6138      	str	r0, [r7, #16]
 800164e:	e008      	b.n	8001662 <HAL_RCC_OscConfig+0x1f6>
 8001650:	f7fe ff8e 	bl	8000570 <HAL_GetTick>
 8001654:	4602      	mov	r2, r0
 8001656:	693b      	ldr	r3, [r7, #16]
 8001658:	1ad3      	subs	r3, r2, r3
 800165a:	2b02      	cmp	r3, #2
 800165c:	d901      	bls.n	8001662 <HAL_RCC_OscConfig+0x1f6>
 800165e:	2303      	movs	r3, #3
 8001660:	e180      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001662:	4b1d      	ldr	r3, [pc, #116]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 8001664:	681b      	ldr	r3, [r3, #0]
 8001666:	f003 0302 	and.w	r3, r3, #2
 800166a:	2b00      	cmp	r3, #0
 800166c:	d1f0      	bne.n	8001650 <HAL_RCC_OscConfig+0x1e4>
 800166e:	687b      	ldr	r3, [r7, #4]
 8001670:	681b      	ldr	r3, [r3, #0]
 8001672:	f003 0308 	and.w	r3, r3, #8
 8001676:	2b00      	cmp	r3, #0
 8001678:	d03a      	beq.n	80016f0 <HAL_RCC_OscConfig+0x284>
 800167a:	687b      	ldr	r3, [r7, #4]
 800167c:	699b      	ldr	r3, [r3, #24]
 800167e:	2b00      	cmp	r3, #0
 8001680:	d019      	beq.n	80016b6 <HAL_RCC_OscConfig+0x24a>
 8001682:	4b17      	ldr	r3, [pc, #92]	; (80016e0 <HAL_RCC_OscConfig+0x274>)
 8001684:	2201      	movs	r2, #1
 8001686:	601a      	str	r2, [r3, #0]
 8001688:	f7fe ff72 	bl	8000570 <HAL_GetTick>
 800168c:	6138      	str	r0, [r7, #16]
 800168e:	e008      	b.n	80016a2 <HAL_RCC_OscConfig+0x236>
 8001690:	f7fe ff6e 	bl	8000570 <HAL_GetTick>
 8001694:	4602      	mov	r2, r0
 8001696:	693b      	ldr	r3, [r7, #16]
 8001698:	1ad3      	subs	r3, r2, r3
 800169a:	2b02      	cmp	r3, #2
 800169c:	d901      	bls.n	80016a2 <HAL_RCC_OscConfig+0x236>
 800169e:	2303      	movs	r3, #3
 80016a0:	e160      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 80016a2:	4b0d      	ldr	r3, [pc, #52]	; (80016d8 <HAL_RCC_OscConfig+0x26c>)
 80016a4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80016a6:	f003 0302 	and.w	r3, r3, #2
 80016aa:	2b00      	cmp	r3, #0
 80016ac:	d0f0      	beq.n	8001690 <HAL_RCC_OscConfig+0x224>
 80016ae:	2001      	movs	r0, #1
 80016b0:	f000 face 	bl	8001c50 <RCC_Delay>
 80016b4:	e01c      	b.n	80016f0 <HAL_RCC_OscConfig+0x284>
 80016b6:	4b0a      	ldr	r3, [pc, #40]	; (80016e0 <HAL_RCC_OscConfig+0x274>)
 80016b8:	2200      	movs	r2, #0
 80016ba:	601a      	str	r2, [r3, #0]
 80016bc:	f7fe ff58 	bl	8000570 <HAL_GetTick>
 80016c0:	6138      	str	r0, [r7, #16]
 80016c2:	e00f      	b.n	80016e4 <HAL_RCC_OscConfig+0x278>
 80016c4:	f7fe ff54 	bl	8000570 <HAL_GetTick>
 80016c8:	4602      	mov	r2, r0
 80016ca:	693b      	ldr	r3, [r7, #16]
 80016cc:	1ad3      	subs	r3, r2, r3
 80016ce:	2b02      	cmp	r3, #2
 80016d0:	d908      	bls.n	80016e4 <HAL_RCC_OscConfig+0x278>
 80016d2:	2303      	movs	r3, #3
 80016d4:	e146      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 80016d6:	bf00      	nop
 80016d8:	40021000 	.word	0x40021000
 80016dc:	42420000 	.word	0x42420000
 80016e0:	42420480 	.word	0x42420480
 80016e4:	4b92      	ldr	r3, [pc, #584]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80016e6:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80016e8:	f003 0302 	and.w	r3, r3, #2
 80016ec:	2b00      	cmp	r3, #0
 80016ee:	d1e9      	bne.n	80016c4 <HAL_RCC_OscConfig+0x258>
 80016f0:	687b      	ldr	r3, [r7, #4]
 80016f2:	681b      	ldr	r3, [r3, #0]
 80016f4:	f003 0304 	and.w	r3, r3, #4
 80016f8:	2b00      	cmp	r3, #0
 80016fa:	f000 80a6 	beq.w	800184a <HAL_RCC_OscConfig+0x3de>
 80016fe:	2300      	movs	r3, #0
 8001700:	75fb      	strb	r3, [r7, #23]
 8001702:	4b8b      	ldr	r3, [pc, #556]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001704:	69db      	ldr	r3, [r3, #28]
 8001706:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 800170a:	2b00      	cmp	r3, #0
 800170c:	d10d      	bne.n	800172a <HAL_RCC_OscConfig+0x2be>
 800170e:	4b88      	ldr	r3, [pc, #544]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001710:	69db      	ldr	r3, [r3, #28]
 8001712:	4a87      	ldr	r2, [pc, #540]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001714:	f043 5380 	orr.w	r3, r3, #268435456	; 0x10000000
 8001718:	61d3      	str	r3, [r2, #28]
 800171a:	4b85      	ldr	r3, [pc, #532]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 800171c:	69db      	ldr	r3, [r3, #28]
 800171e:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 8001722:	60bb      	str	r3, [r7, #8]
 8001724:	68bb      	ldr	r3, [r7, #8]
 8001726:	2301      	movs	r3, #1
 8001728:	75fb      	strb	r3, [r7, #23]
 800172a:	4b82      	ldr	r3, [pc, #520]	; (8001934 <HAL_RCC_OscConfig+0x4c8>)
 800172c:	681b      	ldr	r3, [r3, #0]
 800172e:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8001732:	2b00      	cmp	r3, #0
 8001734:	d118      	bne.n	8001768 <HAL_RCC_OscConfig+0x2fc>
 8001736:	4b7f      	ldr	r3, [pc, #508]	; (8001934 <HAL_RCC_OscConfig+0x4c8>)
 8001738:	681b      	ldr	r3, [r3, #0]
 800173a:	4a7e      	ldr	r2, [pc, #504]	; (8001934 <HAL_RCC_OscConfig+0x4c8>)
 800173c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 8001740:	6013      	str	r3, [r2, #0]
 8001742:	f7fe ff15 	bl	8000570 <HAL_GetTick>
 8001746:	6138      	str	r0, [r7, #16]
 8001748:	e008      	b.n	800175c <HAL_RCC_OscConfig+0x2f0>
 800174a:	f7fe ff11 	bl	8000570 <HAL_GetTick>
 800174e:	4602      	mov	r2, r0
 8001750:	693b      	ldr	r3, [r7, #16]
 8001752:	1ad3      	subs	r3, r2, r3
 8001754:	2b64      	cmp	r3, #100	; 0x64
 8001756:	d901      	bls.n	800175c <HAL_RCC_OscConfig+0x2f0>
 8001758:	2303      	movs	r3, #3
 800175a:	e103      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 800175c:	4b75      	ldr	r3, [pc, #468]	; (8001934 <HAL_RCC_OscConfig+0x4c8>)
 800175e:	681b      	ldr	r3, [r3, #0]
 8001760:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8001764:	2b00      	cmp	r3, #0
 8001766:	d0f0      	beq.n	800174a <HAL_RCC_OscConfig+0x2de>
 8001768:	687b      	ldr	r3, [r7, #4]
 800176a:	68db      	ldr	r3, [r3, #12]
 800176c:	2b01      	cmp	r3, #1
 800176e:	d106      	bne.n	800177e <HAL_RCC_OscConfig+0x312>
 8001770:	4b6f      	ldr	r3, [pc, #444]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001772:	6a1b      	ldr	r3, [r3, #32]
 8001774:	4a6e      	ldr	r2, [pc, #440]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001776:	f043 0301 	orr.w	r3, r3, #1
 800177a:	6213      	str	r3, [r2, #32]
 800177c:	e02d      	b.n	80017da <HAL_RCC_OscConfig+0x36e>
 800177e:	687b      	ldr	r3, [r7, #4]
 8001780:	68db      	ldr	r3, [r3, #12]
 8001782:	2b00      	cmp	r3, #0
 8001784:	d10c      	bne.n	80017a0 <HAL_RCC_OscConfig+0x334>
 8001786:	4b6a      	ldr	r3, [pc, #424]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001788:	6a1b      	ldr	r3, [r3, #32]
 800178a:	4a69      	ldr	r2, [pc, #420]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 800178c:	f023 0301 	bic.w	r3, r3, #1
 8001790:	6213      	str	r3, [r2, #32]
 8001792:	4b67      	ldr	r3, [pc, #412]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001794:	6a1b      	ldr	r3, [r3, #32]
 8001796:	4a66      	ldr	r2, [pc, #408]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001798:	f023 0304 	bic.w	r3, r3, #4
 800179c:	6213      	str	r3, [r2, #32]
 800179e:	e01c      	b.n	80017da <HAL_RCC_OscConfig+0x36e>
 80017a0:	687b      	ldr	r3, [r7, #4]
 80017a2:	68db      	ldr	r3, [r3, #12]
 80017a4:	2b05      	cmp	r3, #5
 80017a6:	d10c      	bne.n	80017c2 <HAL_RCC_OscConfig+0x356>
 80017a8:	4b61      	ldr	r3, [pc, #388]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017aa:	6a1b      	ldr	r3, [r3, #32]
 80017ac:	4a60      	ldr	r2, [pc, #384]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017ae:	f043 0304 	orr.w	r3, r3, #4
 80017b2:	6213      	str	r3, [r2, #32]
 80017b4:	4b5e      	ldr	r3, [pc, #376]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017b6:	6a1b      	ldr	r3, [r3, #32]
 80017b8:	4a5d      	ldr	r2, [pc, #372]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017ba:	f043 0301 	orr.w	r3, r3, #1
 80017be:	6213      	str	r3, [r2, #32]
 80017c0:	e00b      	b.n	80017da <HAL_RCC_OscConfig+0x36e>
 80017c2:	4b5b      	ldr	r3, [pc, #364]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017c4:	6a1b      	ldr	r3, [r3, #32]
 80017c6:	4a5a      	ldr	r2, [pc, #360]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017c8:	f023 0301 	bic.w	r3, r3, #1
 80017cc:	6213      	str	r3, [r2, #32]
 80017ce:	4b58      	ldr	r3, [pc, #352]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017d0:	6a1b      	ldr	r3, [r3, #32]
 80017d2:	4a57      	ldr	r2, [pc, #348]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80017d4:	f023 0304 	bic.w	r3, r3, #4
 80017d8:	6213      	str	r3, [r2, #32]
 80017da:	687b      	ldr	r3, [r7, #4]
 80017dc:	68db      	ldr	r3, [r3, #12]
 80017de:	2b00      	cmp	r3, #0
 80017e0:	d015      	beq.n	800180e <HAL_RCC_OscConfig+0x3a2>
 80017e2:	f7fe fec5 	bl	8000570 <HAL_GetTick>
 80017e6:	6138      	str	r0, [r7, #16]
 80017e8:	e00a      	b.n	8001800 <HAL_RCC_OscConfig+0x394>
 80017ea:	f7fe fec1 	bl	8000570 <HAL_GetTick>
 80017ee:	4602      	mov	r2, r0
 80017f0:	693b      	ldr	r3, [r7, #16]
 80017f2:	1ad3      	subs	r3, r2, r3
 80017f4:	f241 3288 	movw	r2, #5000	; 0x1388
 80017f8:	4293      	cmp	r3, r2
 80017fa:	d901      	bls.n	8001800 <HAL_RCC_OscConfig+0x394>
 80017fc:	2303      	movs	r3, #3
 80017fe:	e0b1      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001800:	4b4b      	ldr	r3, [pc, #300]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001802:	6a1b      	ldr	r3, [r3, #32]
 8001804:	f003 0302 	and.w	r3, r3, #2
 8001808:	2b00      	cmp	r3, #0
 800180a:	d0ee      	beq.n	80017ea <HAL_RCC_OscConfig+0x37e>
 800180c:	e014      	b.n	8001838 <HAL_RCC_OscConfig+0x3cc>
 800180e:	f7fe feaf 	bl	8000570 <HAL_GetTick>
 8001812:	6138      	str	r0, [r7, #16]
 8001814:	e00a      	b.n	800182c <HAL_RCC_OscConfig+0x3c0>
 8001816:	f7fe feab 	bl	8000570 <HAL_GetTick>
 800181a:	4602      	mov	r2, r0
 800181c:	693b      	ldr	r3, [r7, #16]
 800181e:	1ad3      	subs	r3, r2, r3
 8001820:	f241 3288 	movw	r2, #5000	; 0x1388
 8001824:	4293      	cmp	r3, r2
 8001826:	d901      	bls.n	800182c <HAL_RCC_OscConfig+0x3c0>
 8001828:	2303      	movs	r3, #3
 800182a:	e09b      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 800182c:	4b40      	ldr	r3, [pc, #256]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 800182e:	6a1b      	ldr	r3, [r3, #32]
 8001830:	f003 0302 	and.w	r3, r3, #2
 8001834:	2b00      	cmp	r3, #0
 8001836:	d1ee      	bne.n	8001816 <HAL_RCC_OscConfig+0x3aa>
 8001838:	7dfb      	ldrb	r3, [r7, #23]
 800183a:	2b01      	cmp	r3, #1
 800183c:	d105      	bne.n	800184a <HAL_RCC_OscConfig+0x3de>
 800183e:	4b3c      	ldr	r3, [pc, #240]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001840:	69db      	ldr	r3, [r3, #28]
 8001842:	4a3b      	ldr	r2, [pc, #236]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001844:	f023 5380 	bic.w	r3, r3, #268435456	; 0x10000000
 8001848:	61d3      	str	r3, [r2, #28]
 800184a:	687b      	ldr	r3, [r7, #4]
 800184c:	69db      	ldr	r3, [r3, #28]
 800184e:	2b00      	cmp	r3, #0
 8001850:	f000 8087 	beq.w	8001962 <HAL_RCC_OscConfig+0x4f6>
 8001854:	4b36      	ldr	r3, [pc, #216]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001856:	685b      	ldr	r3, [r3, #4]
 8001858:	f003 030c 	and.w	r3, r3, #12
 800185c:	2b08      	cmp	r3, #8
 800185e:	d061      	beq.n	8001924 <HAL_RCC_OscConfig+0x4b8>
 8001860:	687b      	ldr	r3, [r7, #4]
 8001862:	69db      	ldr	r3, [r3, #28]
 8001864:	2b02      	cmp	r3, #2
 8001866:	d146      	bne.n	80018f6 <HAL_RCC_OscConfig+0x48a>
 8001868:	4b33      	ldr	r3, [pc, #204]	; (8001938 <HAL_RCC_OscConfig+0x4cc>)
 800186a:	2200      	movs	r2, #0
 800186c:	601a      	str	r2, [r3, #0]
 800186e:	f7fe fe7f 	bl	8000570 <HAL_GetTick>
 8001872:	6138      	str	r0, [r7, #16]
 8001874:	e008      	b.n	8001888 <HAL_RCC_OscConfig+0x41c>
 8001876:	f7fe fe7b 	bl	8000570 <HAL_GetTick>
 800187a:	4602      	mov	r2, r0
 800187c:	693b      	ldr	r3, [r7, #16]
 800187e:	1ad3      	subs	r3, r2, r3
 8001880:	2b02      	cmp	r3, #2
 8001882:	d901      	bls.n	8001888 <HAL_RCC_OscConfig+0x41c>
 8001884:	2303      	movs	r3, #3
 8001886:	e06d      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001888:	4b29      	ldr	r3, [pc, #164]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 800188a:	681b      	ldr	r3, [r3, #0]
 800188c:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
 8001890:	2b00      	cmp	r3, #0
 8001892:	d1f0      	bne.n	8001876 <HAL_RCC_OscConfig+0x40a>
 8001894:	687b      	ldr	r3, [r7, #4]
 8001896:	6a1b      	ldr	r3, [r3, #32]
 8001898:	f5b3 3f80 	cmp.w	r3, #65536	; 0x10000
 800189c:	d108      	bne.n	80018b0 <HAL_RCC_OscConfig+0x444>
 800189e:	4b24      	ldr	r3, [pc, #144]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80018a0:	685b      	ldr	r3, [r3, #4]
 80018a2:	f423 3200 	bic.w	r2, r3, #131072	; 0x20000
 80018a6:	687b      	ldr	r3, [r7, #4]
 80018a8:	689b      	ldr	r3, [r3, #8]
 80018aa:	4921      	ldr	r1, [pc, #132]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80018ac:	4313      	orrs	r3, r2
 80018ae:	604b      	str	r3, [r1, #4]
 80018b0:	4b1f      	ldr	r3, [pc, #124]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80018b2:	685b      	ldr	r3, [r3, #4]
 80018b4:	f423 1274 	bic.w	r2, r3, #3997696	; 0x3d0000
 80018b8:	687b      	ldr	r3, [r7, #4]
 80018ba:	6a19      	ldr	r1, [r3, #32]
 80018bc:	687b      	ldr	r3, [r7, #4]
 80018be:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80018c0:	430b      	orrs	r3, r1
 80018c2:	491b      	ldr	r1, [pc, #108]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80018c4:	4313      	orrs	r3, r2
 80018c6:	604b      	str	r3, [r1, #4]
 80018c8:	4b1b      	ldr	r3, [pc, #108]	; (8001938 <HAL_RCC_OscConfig+0x4cc>)
 80018ca:	2201      	movs	r2, #1
 80018cc:	601a      	str	r2, [r3, #0]
 80018ce:	f7fe fe4f 	bl	8000570 <HAL_GetTick>
 80018d2:	6138      	str	r0, [r7, #16]
 80018d4:	e008      	b.n	80018e8 <HAL_RCC_OscConfig+0x47c>
 80018d6:	f7fe fe4b 	bl	8000570 <HAL_GetTick>
 80018da:	4602      	mov	r2, r0
 80018dc:	693b      	ldr	r3, [r7, #16]
 80018de:	1ad3      	subs	r3, r2, r3
 80018e0:	2b02      	cmp	r3, #2
 80018e2:	d901      	bls.n	80018e8 <HAL_RCC_OscConfig+0x47c>
 80018e4:	2303      	movs	r3, #3
 80018e6:	e03d      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 80018e8:	4b11      	ldr	r3, [pc, #68]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 80018ea:	681b      	ldr	r3, [r3, #0]
 80018ec:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
 80018f0:	2b00      	cmp	r3, #0
 80018f2:	d0f0      	beq.n	80018d6 <HAL_RCC_OscConfig+0x46a>
 80018f4:	e035      	b.n	8001962 <HAL_RCC_OscConfig+0x4f6>
 80018f6:	4b10      	ldr	r3, [pc, #64]	; (8001938 <HAL_RCC_OscConfig+0x4cc>)
 80018f8:	2200      	movs	r2, #0
 80018fa:	601a      	str	r2, [r3, #0]
 80018fc:	f7fe fe38 	bl	8000570 <HAL_GetTick>
 8001900:	6138      	str	r0, [r7, #16]
 8001902:	e008      	b.n	8001916 <HAL_RCC_OscConfig+0x4aa>
 8001904:	f7fe fe34 	bl	8000570 <HAL_GetTick>
 8001908:	4602      	mov	r2, r0
 800190a:	693b      	ldr	r3, [r7, #16]
 800190c:	1ad3      	subs	r3, r2, r3
 800190e:	2b02      	cmp	r3, #2
 8001910:	d901      	bls.n	8001916 <HAL_RCC_OscConfig+0x4aa>
 8001912:	2303      	movs	r3, #3
 8001914:	e026      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001916:	4b06      	ldr	r3, [pc, #24]	; (8001930 <HAL_RCC_OscConfig+0x4c4>)
 8001918:	681b      	ldr	r3, [r3, #0]
 800191a:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
 800191e:	2b00      	cmp	r3, #0
 8001920:	d1f0      	bne.n	8001904 <HAL_RCC_OscConfig+0x498>
 8001922:	e01e      	b.n	8001962 <HAL_RCC_OscConfig+0x4f6>
 8001924:	687b      	ldr	r3, [r7, #4]
 8001926:	69db      	ldr	r3, [r3, #28]
 8001928:	2b01      	cmp	r3, #1
 800192a:	d107      	bne.n	800193c <HAL_RCC_OscConfig+0x4d0>
 800192c:	2301      	movs	r3, #1
 800192e:	e019      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001930:	40021000 	.word	0x40021000
 8001934:	40007000 	.word	0x40007000
 8001938:	42420060 	.word	0x42420060
 800193c:	4b0b      	ldr	r3, [pc, #44]	; (800196c <HAL_RCC_OscConfig+0x500>)
 800193e:	685b      	ldr	r3, [r3, #4]
 8001940:	60fb      	str	r3, [r7, #12]
 8001942:	68fb      	ldr	r3, [r7, #12]
 8001944:	f403 3280 	and.w	r2, r3, #65536	; 0x10000
 8001948:	687b      	ldr	r3, [r7, #4]
 800194a:	6a1b      	ldr	r3, [r3, #32]
 800194c:	429a      	cmp	r2, r3
 800194e:	d106      	bne.n	800195e <HAL_RCC_OscConfig+0x4f2>
 8001950:	68fb      	ldr	r3, [r7, #12]
 8001952:	f403 1270 	and.w	r2, r3, #3932160	; 0x3c0000
 8001956:	687b      	ldr	r3, [r7, #4]
 8001958:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 800195a:	429a      	cmp	r2, r3
 800195c:	d001      	beq.n	8001962 <HAL_RCC_OscConfig+0x4f6>
 800195e:	2301      	movs	r3, #1
 8001960:	e000      	b.n	8001964 <HAL_RCC_OscConfig+0x4f8>
 8001962:	2300      	movs	r3, #0
 8001964:	4618      	mov	r0, r3
 8001966:	3718      	adds	r7, #24
 8001968:	46bd      	mov	sp, r7
 800196a:	bd80      	pop	{r7, pc}
 800196c:	40021000 	.word	0x40021000

08001970 <HAL_RCC_ClockConfig>:
 8001970:	b580      	push	{r7, lr}
 8001972:	b084      	sub	sp, #16
 8001974:	af00      	add	r7, sp, #0
 8001976:	6078      	str	r0, [r7, #4]
 8001978:	6039      	str	r1, [r7, #0]
 800197a:	687b      	ldr	r3, [r7, #4]
 800197c:	2b00      	cmp	r3, #0
 800197e:	d101      	bne.n	8001984 <HAL_RCC_ClockConfig+0x14>
 8001980:	2301      	movs	r3, #1
 8001982:	e0d0      	b.n	8001b26 <HAL_RCC_ClockConfig+0x1b6>
 8001984:	4b6a      	ldr	r3, [pc, #424]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 8001986:	681b      	ldr	r3, [r3, #0]
 8001988:	f003 0307 	and.w	r3, r3, #7
 800198c:	683a      	ldr	r2, [r7, #0]
 800198e:	429a      	cmp	r2, r3
 8001990:	d910      	bls.n	80019b4 <HAL_RCC_ClockConfig+0x44>
 8001992:	4b67      	ldr	r3, [pc, #412]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 8001994:	681b      	ldr	r3, [r3, #0]
 8001996:	f023 0207 	bic.w	r2, r3, #7
 800199a:	4965      	ldr	r1, [pc, #404]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 800199c:	683b      	ldr	r3, [r7, #0]
 800199e:	4313      	orrs	r3, r2
 80019a0:	600b      	str	r3, [r1, #0]
 80019a2:	4b63      	ldr	r3, [pc, #396]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 80019a4:	681b      	ldr	r3, [r3, #0]
 80019a6:	f003 0307 	and.w	r3, r3, #7
 80019aa:	683a      	ldr	r2, [r7, #0]
 80019ac:	429a      	cmp	r2, r3
 80019ae:	d001      	beq.n	80019b4 <HAL_RCC_ClockConfig+0x44>
 80019b0:	2301      	movs	r3, #1
 80019b2:	e0b8      	b.n	8001b26 <HAL_RCC_ClockConfig+0x1b6>
 80019b4:	687b      	ldr	r3, [r7, #4]
 80019b6:	681b      	ldr	r3, [r3, #0]
 80019b8:	f003 0302 	and.w	r3, r3, #2
 80019bc:	2b00      	cmp	r3, #0
 80019be:	d020      	beq.n	8001a02 <HAL_RCC_ClockConfig+0x92>
 80019c0:	687b      	ldr	r3, [r7, #4]
 80019c2:	681b      	ldr	r3, [r3, #0]
 80019c4:	f003 0304 	and.w	r3, r3, #4
 80019c8:	2b00      	cmp	r3, #0
 80019ca:	d005      	beq.n	80019d8 <HAL_RCC_ClockConfig+0x68>
 80019cc:	4b59      	ldr	r3, [pc, #356]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 80019ce:	685b      	ldr	r3, [r3, #4]
 80019d0:	4a58      	ldr	r2, [pc, #352]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 80019d2:	f443 63e0 	orr.w	r3, r3, #1792	; 0x700
 80019d6:	6053      	str	r3, [r2, #4]
 80019d8:	687b      	ldr	r3, [r7, #4]
 80019da:	681b      	ldr	r3, [r3, #0]
 80019dc:	f003 0308 	and.w	r3, r3, #8
 80019e0:	2b00      	cmp	r3, #0
 80019e2:	d005      	beq.n	80019f0 <HAL_RCC_ClockConfig+0x80>
 80019e4:	4b53      	ldr	r3, [pc, #332]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 80019e6:	685b      	ldr	r3, [r3, #4]
 80019e8:	4a52      	ldr	r2, [pc, #328]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 80019ea:	f443 5360 	orr.w	r3, r3, #14336	; 0x3800
 80019ee:	6053      	str	r3, [r2, #4]
 80019f0:	4b50      	ldr	r3, [pc, #320]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 80019f2:	685b      	ldr	r3, [r3, #4]
 80019f4:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
 80019f8:	687b      	ldr	r3, [r7, #4]
 80019fa:	689b      	ldr	r3, [r3, #8]
 80019fc:	494d      	ldr	r1, [pc, #308]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 80019fe:	4313      	orrs	r3, r2
 8001a00:	604b      	str	r3, [r1, #4]
 8001a02:	687b      	ldr	r3, [r7, #4]
 8001a04:	681b      	ldr	r3, [r3, #0]
 8001a06:	f003 0301 	and.w	r3, r3, #1
 8001a0a:	2b00      	cmp	r3, #0
 8001a0c:	d040      	beq.n	8001a90 <HAL_RCC_ClockConfig+0x120>
 8001a0e:	687b      	ldr	r3, [r7, #4]
 8001a10:	685b      	ldr	r3, [r3, #4]
 8001a12:	2b01      	cmp	r3, #1
 8001a14:	d107      	bne.n	8001a26 <HAL_RCC_ClockConfig+0xb6>
 8001a16:	4b47      	ldr	r3, [pc, #284]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001a18:	681b      	ldr	r3, [r3, #0]
 8001a1a:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 8001a1e:	2b00      	cmp	r3, #0
 8001a20:	d115      	bne.n	8001a4e <HAL_RCC_ClockConfig+0xde>
 8001a22:	2301      	movs	r3, #1
 8001a24:	e07f      	b.n	8001b26 <HAL_RCC_ClockConfig+0x1b6>
 8001a26:	687b      	ldr	r3, [r7, #4]
 8001a28:	685b      	ldr	r3, [r3, #4]
 8001a2a:	2b02      	cmp	r3, #2
 8001a2c:	d107      	bne.n	8001a3e <HAL_RCC_ClockConfig+0xce>
 8001a2e:	4b41      	ldr	r3, [pc, #260]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001a30:	681b      	ldr	r3, [r3, #0]
 8001a32:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
 8001a36:	2b00      	cmp	r3, #0
 8001a38:	d109      	bne.n	8001a4e <HAL_RCC_ClockConfig+0xde>
 8001a3a:	2301      	movs	r3, #1
 8001a3c:	e073      	b.n	8001b26 <HAL_RCC_ClockConfig+0x1b6>
 8001a3e:	4b3d      	ldr	r3, [pc, #244]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001a40:	681b      	ldr	r3, [r3, #0]
 8001a42:	f003 0302 	and.w	r3, r3, #2
 8001a46:	2b00      	cmp	r3, #0
 8001a48:	d101      	bne.n	8001a4e <HAL_RCC_ClockConfig+0xde>
 8001a4a:	2301      	movs	r3, #1
 8001a4c:	e06b      	b.n	8001b26 <HAL_RCC_ClockConfig+0x1b6>
 8001a4e:	4b39      	ldr	r3, [pc, #228]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001a50:	685b      	ldr	r3, [r3, #4]
 8001a52:	f023 0203 	bic.w	r2, r3, #3
 8001a56:	687b      	ldr	r3, [r7, #4]
 8001a58:	685b      	ldr	r3, [r3, #4]
 8001a5a:	4936      	ldr	r1, [pc, #216]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001a5c:	4313      	orrs	r3, r2
 8001a5e:	604b      	str	r3, [r1, #4]
 8001a60:	f7fe fd86 	bl	8000570 <HAL_GetTick>
 8001a64:	60f8      	str	r0, [r7, #12]
 8001a66:	e00a      	b.n	8001a7e <HAL_RCC_ClockConfig+0x10e>
 8001a68:	f7fe fd82 	bl	8000570 <HAL_GetTick>
 8001a6c:	4602      	mov	r2, r0
 8001a6e:	68fb      	ldr	r3, [r7, #12]
 8001a70:	1ad3      	subs	r3, r2, r3
 8001a72:	f241 3288 	movw	r2, #5000	; 0x1388
 8001a76:	4293      	cmp	r3, r2
 8001a78:	d901      	bls.n	8001a7e <HAL_RCC_ClockConfig+0x10e>
 8001a7a:	2303      	movs	r3, #3
 8001a7c:	e053      	b.n	8001b26 <HAL_RCC_ClockConfig+0x1b6>
 8001a7e:	4b2d      	ldr	r3, [pc, #180]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001a80:	685b      	ldr	r3, [r3, #4]
 8001a82:	f003 020c 	and.w	r2, r3, #12
 8001a86:	687b      	ldr	r3, [r7, #4]
 8001a88:	685b      	ldr	r3, [r3, #4]
 8001a8a:	009b      	lsls	r3, r3, #2
 8001a8c:	429a      	cmp	r2, r3
 8001a8e:	d1eb      	bne.n	8001a68 <HAL_RCC_ClockConfig+0xf8>
 8001a90:	4b27      	ldr	r3, [pc, #156]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 8001a92:	681b      	ldr	r3, [r3, #0]
 8001a94:	f003 0307 	and.w	r3, r3, #7
 8001a98:	683a      	ldr	r2, [r7, #0]
 8001a9a:	429a      	cmp	r2, r3
 8001a9c:	d210      	bcs.n	8001ac0 <HAL_RCC_ClockConfig+0x150>
 8001a9e:	4b24      	ldr	r3, [pc, #144]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 8001aa0:	681b      	ldr	r3, [r3, #0]
 8001aa2:	f023 0207 	bic.w	r2, r3, #7
 8001aa6:	4922      	ldr	r1, [pc, #136]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 8001aa8:	683b      	ldr	r3, [r7, #0]
 8001aaa:	4313      	orrs	r3, r2
 8001aac:	600b      	str	r3, [r1, #0]
 8001aae:	4b20      	ldr	r3, [pc, #128]	; (8001b30 <HAL_RCC_ClockConfig+0x1c0>)
 8001ab0:	681b      	ldr	r3, [r3, #0]
 8001ab2:	f003 0307 	and.w	r3, r3, #7
 8001ab6:	683a      	ldr	r2, [r7, #0]
 8001ab8:	429a      	cmp	r2, r3
 8001aba:	d001      	beq.n	8001ac0 <HAL_RCC_ClockConfig+0x150>
 8001abc:	2301      	movs	r3, #1
 8001abe:	e032      	b.n	8001b26 <HAL_RCC_ClockConfig+0x1b6>
 8001ac0:	687b      	ldr	r3, [r7, #4]
 8001ac2:	681b      	ldr	r3, [r3, #0]
 8001ac4:	f003 0304 	and.w	r3, r3, #4
 8001ac8:	2b00      	cmp	r3, #0
 8001aca:	d008      	beq.n	8001ade <HAL_RCC_ClockConfig+0x16e>
 8001acc:	4b19      	ldr	r3, [pc, #100]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001ace:	685b      	ldr	r3, [r3, #4]
 8001ad0:	f423 62e0 	bic.w	r2, r3, #1792	; 0x700
 8001ad4:	687b      	ldr	r3, [r7, #4]
 8001ad6:	68db      	ldr	r3, [r3, #12]
 8001ad8:	4916      	ldr	r1, [pc, #88]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001ada:	4313      	orrs	r3, r2
 8001adc:	604b      	str	r3, [r1, #4]
 8001ade:	687b      	ldr	r3, [r7, #4]
 8001ae0:	681b      	ldr	r3, [r3, #0]
 8001ae2:	f003 0308 	and.w	r3, r3, #8
 8001ae6:	2b00      	cmp	r3, #0
 8001ae8:	d009      	beq.n	8001afe <HAL_RCC_ClockConfig+0x18e>
 8001aea:	4b12      	ldr	r3, [pc, #72]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001aec:	685b      	ldr	r3, [r3, #4]
 8001aee:	f423 5260 	bic.w	r2, r3, #14336	; 0x3800
 8001af2:	687b      	ldr	r3, [r7, #4]
 8001af4:	691b      	ldr	r3, [r3, #16]
 8001af6:	00db      	lsls	r3, r3, #3
 8001af8:	490e      	ldr	r1, [pc, #56]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001afa:	4313      	orrs	r3, r2
 8001afc:	604b      	str	r3, [r1, #4]
 8001afe:	f000 f821 	bl	8001b44 <HAL_RCC_GetSysClockFreq>
 8001b02:	4602      	mov	r2, r0
 8001b04:	4b0b      	ldr	r3, [pc, #44]	; (8001b34 <HAL_RCC_ClockConfig+0x1c4>)
 8001b06:	685b      	ldr	r3, [r3, #4]
 8001b08:	091b      	lsrs	r3, r3, #4
 8001b0a:	f003 030f 	and.w	r3, r3, #15
 8001b0e:	490a      	ldr	r1, [pc, #40]	; (8001b38 <HAL_RCC_ClockConfig+0x1c8>)
 8001b10:	5ccb      	ldrb	r3, [r1, r3]
 8001b12:	fa22 f303 	lsr.w	r3, r2, r3
 8001b16:	4a09      	ldr	r2, [pc, #36]	; (8001b3c <HAL_RCC_ClockConfig+0x1cc>)
 8001b18:	6013      	str	r3, [r2, #0]
 8001b1a:	4b09      	ldr	r3, [pc, #36]	; (8001b40 <HAL_RCC_ClockConfig+0x1d0>)
 8001b1c:	681b      	ldr	r3, [r3, #0]
 8001b1e:	4618      	mov	r0, r3
 8001b20:	f7fe fcf6 	bl	8000510 <HAL_InitTick>
 8001b24:	2300      	movs	r3, #0
 8001b26:	4618      	mov	r0, r3
 8001b28:	3710      	adds	r7, #16
 8001b2a:	46bd      	mov	sp, r7
 8001b2c:	bd80      	pop	{r7, pc}
 8001b2e:	bf00      	nop
 8001b30:	40022000 	.word	0x40022000
 8001b34:	40021000 	.word	0x40021000
 8001b38:	08004844 	.word	0x08004844
 8001b3c:	20000064 	.word	0x20000064
 8001b40:	20000068 	.word	0x20000068

08001b44 <HAL_RCC_GetSysClockFreq>:
 8001b44:	b480      	push	{r7}
 8001b46:	b087      	sub	sp, #28
 8001b48:	af00      	add	r7, sp, #0
 8001b4a:	2300      	movs	r3, #0
 8001b4c:	60fb      	str	r3, [r7, #12]
 8001b4e:	2300      	movs	r3, #0
 8001b50:	60bb      	str	r3, [r7, #8]
 8001b52:	2300      	movs	r3, #0
 8001b54:	617b      	str	r3, [r7, #20]
 8001b56:	2300      	movs	r3, #0
 8001b58:	607b      	str	r3, [r7, #4]
 8001b5a:	2300      	movs	r3, #0
 8001b5c:	613b      	str	r3, [r7, #16]
 8001b5e:	4b1e      	ldr	r3, [pc, #120]	; (8001bd8 <HAL_RCC_GetSysClockFreq+0x94>)
 8001b60:	685b      	ldr	r3, [r3, #4]
 8001b62:	60fb      	str	r3, [r7, #12]
 8001b64:	68fb      	ldr	r3, [r7, #12]
 8001b66:	f003 030c 	and.w	r3, r3, #12
 8001b6a:	2b04      	cmp	r3, #4
 8001b6c:	d002      	beq.n	8001b74 <HAL_RCC_GetSysClockFreq+0x30>
 8001b6e:	2b08      	cmp	r3, #8
 8001b70:	d003      	beq.n	8001b7a <HAL_RCC_GetSysClockFreq+0x36>
 8001b72:	e027      	b.n	8001bc4 <HAL_RCC_GetSysClockFreq+0x80>
 8001b74:	4b19      	ldr	r3, [pc, #100]	; (8001bdc <HAL_RCC_GetSysClockFreq+0x98>)
 8001b76:	613b      	str	r3, [r7, #16]
 8001b78:	e027      	b.n	8001bca <HAL_RCC_GetSysClockFreq+0x86>
 8001b7a:	68fb      	ldr	r3, [r7, #12]
 8001b7c:	0c9b      	lsrs	r3, r3, #18
 8001b7e:	f003 030f 	and.w	r3, r3, #15
 8001b82:	4a17      	ldr	r2, [pc, #92]	; (8001be0 <HAL_RCC_GetSysClockFreq+0x9c>)
 8001b84:	5cd3      	ldrb	r3, [r2, r3]
 8001b86:	607b      	str	r3, [r7, #4]
 8001b88:	68fb      	ldr	r3, [r7, #12]
 8001b8a:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 8001b8e:	2b00      	cmp	r3, #0
 8001b90:	d010      	beq.n	8001bb4 <HAL_RCC_GetSysClockFreq+0x70>
 8001b92:	4b11      	ldr	r3, [pc, #68]	; (8001bd8 <HAL_RCC_GetSysClockFreq+0x94>)
 8001b94:	685b      	ldr	r3, [r3, #4]
 8001b96:	0c5b      	lsrs	r3, r3, #17
 8001b98:	f003 0301 	and.w	r3, r3, #1
 8001b9c:	4a11      	ldr	r2, [pc, #68]	; (8001be4 <HAL_RCC_GetSysClockFreq+0xa0>)
 8001b9e:	5cd3      	ldrb	r3, [r2, r3]
 8001ba0:	60bb      	str	r3, [r7, #8]
 8001ba2:	687b      	ldr	r3, [r7, #4]
 8001ba4:	4a0d      	ldr	r2, [pc, #52]	; (8001bdc <HAL_RCC_GetSysClockFreq+0x98>)
 8001ba6:	fb03 f202 	mul.w	r2, r3, r2
 8001baa:	68bb      	ldr	r3, [r7, #8]
 8001bac:	fbb2 f3f3 	udiv	r3, r2, r3
 8001bb0:	617b      	str	r3, [r7, #20]
 8001bb2:	e004      	b.n	8001bbe <HAL_RCC_GetSysClockFreq+0x7a>
 8001bb4:	687b      	ldr	r3, [r7, #4]
 8001bb6:	4a0c      	ldr	r2, [pc, #48]	; (8001be8 <HAL_RCC_GetSysClockFreq+0xa4>)
 8001bb8:	fb02 f303 	mul.w	r3, r2, r3
 8001bbc:	617b      	str	r3, [r7, #20]
 8001bbe:	697b      	ldr	r3, [r7, #20]
 8001bc0:	613b      	str	r3, [r7, #16]
 8001bc2:	e002      	b.n	8001bca <HAL_RCC_GetSysClockFreq+0x86>
 8001bc4:	4b05      	ldr	r3, [pc, #20]	; (8001bdc <HAL_RCC_GetSysClockFreq+0x98>)
 8001bc6:	613b      	str	r3, [r7, #16]
 8001bc8:	bf00      	nop
 8001bca:	693b      	ldr	r3, [r7, #16]
 8001bcc:	4618      	mov	r0, r3
 8001bce:	371c      	adds	r7, #28
 8001bd0:	46bd      	mov	sp, r7
 8001bd2:	bc80      	pop	{r7}
 8001bd4:	4770      	bx	lr
 8001bd6:	bf00      	nop
 8001bd8:	40021000 	.word	0x40021000
 8001bdc:	007a1200 	.word	0x007a1200
 8001be0:	0800485c 	.word	0x0800485c
 8001be4:	0800486c 	.word	0x0800486c
 8001be8:	003d0900 	.word	0x003d0900

08001bec <HAL_RCC_GetHCLKFreq>:
 8001bec:	b480      	push	{r7}
 8001bee:	af00      	add	r7, sp, #0
 8001bf0:	4b02      	ldr	r3, [pc, #8]	; (8001bfc <HAL_RCC_GetHCLKFreq+0x10>)
 8001bf2:	681b      	ldr	r3, [r3, #0]
 8001bf4:	4618      	mov	r0, r3
 8001bf6:	46bd      	mov	sp, r7
 8001bf8:	bc80      	pop	{r7}
 8001bfa:	4770      	bx	lr
 8001bfc:	20000064 	.word	0x20000064

08001c00 <HAL_RCC_GetPCLK1Freq>:
 8001c00:	b580      	push	{r7, lr}
 8001c02:	af00      	add	r7, sp, #0
 8001c04:	f7ff fff2 	bl	8001bec <HAL_RCC_GetHCLKFreq>
 8001c08:	4602      	mov	r2, r0
 8001c0a:	4b05      	ldr	r3, [pc, #20]	; (8001c20 <HAL_RCC_GetPCLK1Freq+0x20>)
 8001c0c:	685b      	ldr	r3, [r3, #4]
 8001c0e:	0a1b      	lsrs	r3, r3, #8
 8001c10:	f003 0307 	and.w	r3, r3, #7
 8001c14:	4903      	ldr	r1, [pc, #12]	; (8001c24 <HAL_RCC_GetPCLK1Freq+0x24>)
 8001c16:	5ccb      	ldrb	r3, [r1, r3]
 8001c18:	fa22 f303 	lsr.w	r3, r2, r3
 8001c1c:	4618      	mov	r0, r3
 8001c1e:	bd80      	pop	{r7, pc}
 8001c20:	40021000 	.word	0x40021000
 8001c24:	08004854 	.word	0x08004854

08001c28 <HAL_RCC_GetPCLK2Freq>:
 8001c28:	b580      	push	{r7, lr}
 8001c2a:	af00      	add	r7, sp, #0
 8001c2c:	f7ff ffde 	bl	8001bec <HAL_RCC_GetHCLKFreq>
 8001c30:	4602      	mov	r2, r0
 8001c32:	4b05      	ldr	r3, [pc, #20]	; (8001c48 <HAL_RCC_GetPCLK2Freq+0x20>)
 8001c34:	685b      	ldr	r3, [r3, #4]
 8001c36:	0adb      	lsrs	r3, r3, #11
 8001c38:	f003 0307 	and.w	r3, r3, #7
 8001c3c:	4903      	ldr	r1, [pc, #12]	; (8001c4c <HAL_RCC_GetPCLK2Freq+0x24>)
 8001c3e:	5ccb      	ldrb	r3, [r1, r3]
 8001c40:	fa22 f303 	lsr.w	r3, r2, r3
 8001c44:	4618      	mov	r0, r3
 8001c46:	bd80      	pop	{r7, pc}
 8001c48:	40021000 	.word	0x40021000
 8001c4c:	08004854 	.word	0x08004854

08001c50 <RCC_Delay>:
 8001c50:	b480      	push	{r7}
 8001c52:	b085      	sub	sp, #20
 8001c54:	af00      	add	r7, sp, #0
 8001c56:	6078      	str	r0, [r7, #4]
 8001c58:	4b0a      	ldr	r3, [pc, #40]	; (8001c84 <RCC_Delay+0x34>)
 8001c5a:	681b      	ldr	r3, [r3, #0]
 8001c5c:	4a0a      	ldr	r2, [pc, #40]	; (8001c88 <RCC_Delay+0x38>)
 8001c5e:	fba2 2303 	umull	r2, r3, r2, r3
 8001c62:	0a5b      	lsrs	r3, r3, #9
 8001c64:	687a      	ldr	r2, [r7, #4]
 8001c66:	fb02 f303 	mul.w	r3, r2, r3
 8001c6a:	60fb      	str	r3, [r7, #12]
 8001c6c:	bf00      	nop
 8001c6e:	68fb      	ldr	r3, [r7, #12]
 8001c70:	1e5a      	subs	r2, r3, #1
 8001c72:	60fa      	str	r2, [r7, #12]
 8001c74:	2b00      	cmp	r3, #0
 8001c76:	d1f9      	bne.n	8001c6c <RCC_Delay+0x1c>
 8001c78:	bf00      	nop
 8001c7a:	bf00      	nop
 8001c7c:	3714      	adds	r7, #20
 8001c7e:	46bd      	mov	sp, r7
 8001c80:	bc80      	pop	{r7}
 8001c82:	4770      	bx	lr
 8001c84:	20000064 	.word	0x20000064
 8001c88:	10624dd3 	.word	0x10624dd3

08001c8c <HAL_UART_Init>:
 8001c8c:	b580      	push	{r7, lr}
 8001c8e:	b082      	sub	sp, #8
 8001c90:	af00      	add	r7, sp, #0
 8001c92:	6078      	str	r0, [r7, #4]
 8001c94:	687b      	ldr	r3, [r7, #4]
 8001c96:	2b00      	cmp	r3, #0
 8001c98:	d101      	bne.n	8001c9e <HAL_UART_Init+0x12>
 8001c9a:	2301      	movs	r3, #1
 8001c9c:	e042      	b.n	8001d24 <HAL_UART_Init+0x98>
 8001c9e:	687b      	ldr	r3, [r7, #4]
 8001ca0:	f893 3041 	ldrb.w	r3, [r3, #65]	; 0x41
 8001ca4:	b2db      	uxtb	r3, r3
 8001ca6:	2b00      	cmp	r3, #0
 8001ca8:	d106      	bne.n	8001cb8 <HAL_UART_Init+0x2c>
 8001caa:	687b      	ldr	r3, [r7, #4]
 8001cac:	2200      	movs	r2, #0
 8001cae:	f883 2040 	strb.w	r2, [r3, #64]	; 0x40
 8001cb2:	6878      	ldr	r0, [r7, #4]
 8001cb4:	f000 f83a 	bl	8001d2c <HAL_UART_MspInit>
 8001cb8:	687b      	ldr	r3, [r7, #4]
 8001cba:	2224      	movs	r2, #36	; 0x24
 8001cbc:	f883 2041 	strb.w	r2, [r3, #65]	; 0x41
 8001cc0:	687b      	ldr	r3, [r7, #4]
 8001cc2:	681b      	ldr	r3, [r3, #0]
 8001cc4:	68da      	ldr	r2, [r3, #12]
 8001cc6:	687b      	ldr	r3, [r7, #4]
 8001cc8:	681b      	ldr	r3, [r3, #0]
 8001cca:	f422 5200 	bic.w	r2, r2, #8192	; 0x2000
 8001cce:	60da      	str	r2, [r3, #12]
 8001cd0:	6878      	ldr	r0, [r7, #4]
 8001cd2:	f000 fcdd 	bl	8002690 <UART_SetConfig>
 8001cd6:	687b      	ldr	r3, [r7, #4]
 8001cd8:	681b      	ldr	r3, [r3, #0]
 8001cda:	691a      	ldr	r2, [r3, #16]
 8001cdc:	687b      	ldr	r3, [r7, #4]
 8001cde:	681b      	ldr	r3, [r3, #0]
 8001ce0:	f422 4290 	bic.w	r2, r2, #18432	; 0x4800
 8001ce4:	611a      	str	r2, [r3, #16]
 8001ce6:	687b      	ldr	r3, [r7, #4]
 8001ce8:	681b      	ldr	r3, [r3, #0]
 8001cea:	695a      	ldr	r2, [r3, #20]
 8001cec:	687b      	ldr	r3, [r7, #4]
 8001cee:	681b      	ldr	r3, [r3, #0]
 8001cf0:	f022 022a 	bic.w	r2, r2, #42	; 0x2a
 8001cf4:	615a      	str	r2, [r3, #20]
 8001cf6:	687b      	ldr	r3, [r7, #4]
 8001cf8:	681b      	ldr	r3, [r3, #0]
 8001cfa:	68da      	ldr	r2, [r3, #12]
 8001cfc:	687b      	ldr	r3, [r7, #4]
 8001cfe:	681b      	ldr	r3, [r3, #0]
 8001d00:	f442 5200 	orr.w	r2, r2, #8192	; 0x2000
 8001d04:	60da      	str	r2, [r3, #12]
 8001d06:	687b      	ldr	r3, [r7, #4]
 8001d08:	2200      	movs	r2, #0
 8001d0a:	645a      	str	r2, [r3, #68]	; 0x44
 8001d0c:	687b      	ldr	r3, [r7, #4]
 8001d0e:	2220      	movs	r2, #32
 8001d10:	f883 2041 	strb.w	r2, [r3, #65]	; 0x41
 8001d14:	687b      	ldr	r3, [r7, #4]
 8001d16:	2220      	movs	r2, #32
 8001d18:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
 8001d1c:	687b      	ldr	r3, [r7, #4]
 8001d1e:	2200      	movs	r2, #0
 8001d20:	635a      	str	r2, [r3, #52]	; 0x34
 8001d22:	2300      	movs	r3, #0
 8001d24:	4618      	mov	r0, r3
 8001d26:	3708      	adds	r7, #8
 8001d28:	46bd      	mov	sp, r7
 8001d2a:	bd80      	pop	{r7, pc}

08001d2c <HAL_UART_MspInit>:
 8001d2c:	b480      	push	{r7}
 8001d2e:	b083      	sub	sp, #12
 8001d30:	af00      	add	r7, sp, #0
 8001d32:	6078      	str	r0, [r7, #4]
 8001d34:	bf00      	nop
 8001d36:	370c      	adds	r7, #12
 8001d38:	46bd      	mov	sp, r7
 8001d3a:	bc80      	pop	{r7}
 8001d3c:	4770      	bx	lr

08001d3e <HAL_UART_Receive_IT>:
 8001d3e:	b580      	push	{r7, lr}
 8001d40:	b084      	sub	sp, #16
 8001d42:	af00      	add	r7, sp, #0
 8001d44:	60f8      	str	r0, [r7, #12]
 8001d46:	60b9      	str	r1, [r7, #8]
 8001d48:	4613      	mov	r3, r2
 8001d4a:	80fb      	strh	r3, [r7, #6]
 8001d4c:	68fb      	ldr	r3, [r7, #12]
 8001d4e:	f893 3042 	ldrb.w	r3, [r3, #66]	; 0x42
 8001d52:	b2db      	uxtb	r3, r3
 8001d54:	2b20      	cmp	r3, #32
 8001d56:	d112      	bne.n	8001d7e <HAL_UART_Receive_IT+0x40>
 8001d58:	68bb      	ldr	r3, [r7, #8]
 8001d5a:	2b00      	cmp	r3, #0
 8001d5c:	d002      	beq.n	8001d64 <HAL_UART_Receive_IT+0x26>
 8001d5e:	88fb      	ldrh	r3, [r7, #6]
 8001d60:	2b00      	cmp	r3, #0
 8001d62:	d101      	bne.n	8001d68 <HAL_UART_Receive_IT+0x2a>
 8001d64:	2301      	movs	r3, #1
 8001d66:	e00b      	b.n	8001d80 <HAL_UART_Receive_IT+0x42>
 8001d68:	68fb      	ldr	r3, [r7, #12]
 8001d6a:	2200      	movs	r2, #0
 8001d6c:	631a      	str	r2, [r3, #48]	; 0x30
 8001d6e:	88fb      	ldrh	r3, [r7, #6]
 8001d70:	461a      	mov	r2, r3
 8001d72:	68b9      	ldr	r1, [r7, #8]
 8001d74:	68f8      	ldr	r0, [r7, #12]
 8001d76:	f000 fab6 	bl	80022e6 <UART_Start_Receive_IT>
 8001d7a:	4603      	mov	r3, r0
 8001d7c:	e000      	b.n	8001d80 <HAL_UART_Receive_IT+0x42>
 8001d7e:	2302      	movs	r3, #2
 8001d80:	4618      	mov	r0, r3
 8001d82:	3710      	adds	r7, #16
 8001d84:	46bd      	mov	sp, r7
 8001d86:	bd80      	pop	{r7, pc}

08001d88 <HAL_UART_IRQHandler>:
 8001d88:	b580      	push	{r7, lr}
 8001d8a:	b0ba      	sub	sp, #232	; 0xe8
 8001d8c:	af00      	add	r7, sp, #0
 8001d8e:	6078      	str	r0, [r7, #4]
 8001d90:	687b      	ldr	r3, [r7, #4]
 8001d92:	681b      	ldr	r3, [r3, #0]
 8001d94:	681b      	ldr	r3, [r3, #0]
 8001d96:	f8c7 30e4 	str.w	r3, [r7, #228]	; 0xe4
 8001d9a:	687b      	ldr	r3, [r7, #4]
 8001d9c:	681b      	ldr	r3, [r3, #0]
 8001d9e:	68db      	ldr	r3, [r3, #12]
 8001da0:	f8c7 30e0 	str.w	r3, [r7, #224]	; 0xe0
 8001da4:	687b      	ldr	r3, [r7, #4]
 8001da6:	681b      	ldr	r3, [r3, #0]
 8001da8:	695b      	ldr	r3, [r3, #20]
 8001daa:	f8c7 30dc 	str.w	r3, [r7, #220]	; 0xdc
 8001dae:	2300      	movs	r3, #0
 8001db0:	f8c7 30d8 	str.w	r3, [r7, #216]	; 0xd8
 8001db4:	2300      	movs	r3, #0
 8001db6:	f8c7 30d4 	str.w	r3, [r7, #212]	; 0xd4
 8001dba:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001dbe:	f003 030f 	and.w	r3, r3, #15
 8001dc2:	f8c7 30d8 	str.w	r3, [r7, #216]	; 0xd8
 8001dc6:	f8d7 30d8 	ldr.w	r3, [r7, #216]	; 0xd8
 8001dca:	2b00      	cmp	r3, #0
 8001dcc:	d10f      	bne.n	8001dee <HAL_UART_IRQHandler+0x66>
 8001dce:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001dd2:	f003 0320 	and.w	r3, r3, #32
 8001dd6:	2b00      	cmp	r3, #0
 8001dd8:	d009      	beq.n	8001dee <HAL_UART_IRQHandler+0x66>
 8001dda:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 8001dde:	f003 0320 	and.w	r3, r3, #32
 8001de2:	2b00      	cmp	r3, #0
 8001de4:	d003      	beq.n	8001dee <HAL_UART_IRQHandler+0x66>
 8001de6:	6878      	ldr	r0, [r7, #4]
 8001de8:	f000 fb93 	bl	8002512 <UART_Receive_IT>
 8001dec:	e25b      	b.n	80022a6 <HAL_UART_IRQHandler+0x51e>
 8001dee:	f8d7 30d8 	ldr.w	r3, [r7, #216]	; 0xd8
 8001df2:	2b00      	cmp	r3, #0
 8001df4:	f000 80de 	beq.w	8001fb4 <HAL_UART_IRQHandler+0x22c>
 8001df8:	f8d7 30dc 	ldr.w	r3, [r7, #220]	; 0xdc
 8001dfc:	f003 0301 	and.w	r3, r3, #1
 8001e00:	2b00      	cmp	r3, #0
 8001e02:	d106      	bne.n	8001e12 <HAL_UART_IRQHandler+0x8a>
 8001e04:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 8001e08:	f403 7390 	and.w	r3, r3, #288	; 0x120
 8001e0c:	2b00      	cmp	r3, #0
 8001e0e:	f000 80d1 	beq.w	8001fb4 <HAL_UART_IRQHandler+0x22c>
 8001e12:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001e16:	f003 0301 	and.w	r3, r3, #1
 8001e1a:	2b00      	cmp	r3, #0
 8001e1c:	d00b      	beq.n	8001e36 <HAL_UART_IRQHandler+0xae>
 8001e1e:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 8001e22:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8001e26:	2b00      	cmp	r3, #0
 8001e28:	d005      	beq.n	8001e36 <HAL_UART_IRQHandler+0xae>
 8001e2a:	687b      	ldr	r3, [r7, #4]
 8001e2c:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 8001e2e:	f043 0201 	orr.w	r2, r3, #1
 8001e32:	687b      	ldr	r3, [r7, #4]
 8001e34:	645a      	str	r2, [r3, #68]	; 0x44
 8001e36:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001e3a:	f003 0304 	and.w	r3, r3, #4
 8001e3e:	2b00      	cmp	r3, #0
 8001e40:	d00b      	beq.n	8001e5a <HAL_UART_IRQHandler+0xd2>
 8001e42:	f8d7 30dc 	ldr.w	r3, [r7, #220]	; 0xdc
 8001e46:	f003 0301 	and.w	r3, r3, #1
 8001e4a:	2b00      	cmp	r3, #0
 8001e4c:	d005      	beq.n	8001e5a <HAL_UART_IRQHandler+0xd2>
 8001e4e:	687b      	ldr	r3, [r7, #4]
 8001e50:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 8001e52:	f043 0202 	orr.w	r2, r3, #2
 8001e56:	687b      	ldr	r3, [r7, #4]
 8001e58:	645a      	str	r2, [r3, #68]	; 0x44
 8001e5a:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001e5e:	f003 0302 	and.w	r3, r3, #2
 8001e62:	2b00      	cmp	r3, #0
 8001e64:	d00b      	beq.n	8001e7e <HAL_UART_IRQHandler+0xf6>
 8001e66:	f8d7 30dc 	ldr.w	r3, [r7, #220]	; 0xdc
 8001e6a:	f003 0301 	and.w	r3, r3, #1
 8001e6e:	2b00      	cmp	r3, #0
 8001e70:	d005      	beq.n	8001e7e <HAL_UART_IRQHandler+0xf6>
 8001e72:	687b      	ldr	r3, [r7, #4]
 8001e74:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 8001e76:	f043 0204 	orr.w	r2, r3, #4
 8001e7a:	687b      	ldr	r3, [r7, #4]
 8001e7c:	645a      	str	r2, [r3, #68]	; 0x44
 8001e7e:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001e82:	f003 0308 	and.w	r3, r3, #8
 8001e86:	2b00      	cmp	r3, #0
 8001e88:	d011      	beq.n	8001eae <HAL_UART_IRQHandler+0x126>
 8001e8a:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 8001e8e:	f003 0320 	and.w	r3, r3, #32
 8001e92:	2b00      	cmp	r3, #0
 8001e94:	d105      	bne.n	8001ea2 <HAL_UART_IRQHandler+0x11a>
 8001e96:	f8d7 30dc 	ldr.w	r3, [r7, #220]	; 0xdc
 8001e9a:	f003 0301 	and.w	r3, r3, #1
 8001e9e:	2b00      	cmp	r3, #0
 8001ea0:	d005      	beq.n	8001eae <HAL_UART_IRQHandler+0x126>
 8001ea2:	687b      	ldr	r3, [r7, #4]
 8001ea4:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 8001ea6:	f043 0208 	orr.w	r2, r3, #8
 8001eaa:	687b      	ldr	r3, [r7, #4]
 8001eac:	645a      	str	r2, [r3, #68]	; 0x44
 8001eae:	687b      	ldr	r3, [r7, #4]
 8001eb0:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 8001eb2:	2b00      	cmp	r3, #0
 8001eb4:	f000 81f2 	beq.w	800229c <HAL_UART_IRQHandler+0x514>
 8001eb8:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001ebc:	f003 0320 	and.w	r3, r3, #32
 8001ec0:	2b00      	cmp	r3, #0
 8001ec2:	d008      	beq.n	8001ed6 <HAL_UART_IRQHandler+0x14e>
 8001ec4:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 8001ec8:	f003 0320 	and.w	r3, r3, #32
 8001ecc:	2b00      	cmp	r3, #0
 8001ece:	d002      	beq.n	8001ed6 <HAL_UART_IRQHandler+0x14e>
 8001ed0:	6878      	ldr	r0, [r7, #4]
 8001ed2:	f000 fb1e 	bl	8002512 <UART_Receive_IT>
 8001ed6:	687b      	ldr	r3, [r7, #4]
 8001ed8:	681b      	ldr	r3, [r3, #0]
 8001eda:	695b      	ldr	r3, [r3, #20]
 8001edc:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8001ee0:	2b00      	cmp	r3, #0
 8001ee2:	bf14      	ite	ne
 8001ee4:	2301      	movne	r3, #1
 8001ee6:	2300      	moveq	r3, #0
 8001ee8:	b2db      	uxtb	r3, r3
 8001eea:	f8c7 30d4 	str.w	r3, [r7, #212]	; 0xd4
 8001eee:	687b      	ldr	r3, [r7, #4]
 8001ef0:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 8001ef2:	f003 0308 	and.w	r3, r3, #8
 8001ef6:	2b00      	cmp	r3, #0
 8001ef8:	d103      	bne.n	8001f02 <HAL_UART_IRQHandler+0x17a>
 8001efa:	f8d7 30d4 	ldr.w	r3, [r7, #212]	; 0xd4
 8001efe:	2b00      	cmp	r3, #0
 8001f00:	d04f      	beq.n	8001fa2 <HAL_UART_IRQHandler+0x21a>
 8001f02:	6878      	ldr	r0, [r7, #4]
 8001f04:	f000 fa28 	bl	8002358 <UART_EndRxTransfer>
 8001f08:	687b      	ldr	r3, [r7, #4]
 8001f0a:	681b      	ldr	r3, [r3, #0]
 8001f0c:	695b      	ldr	r3, [r3, #20]
 8001f0e:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8001f12:	2b00      	cmp	r3, #0
 8001f14:	d041      	beq.n	8001f9a <HAL_UART_IRQHandler+0x212>
 8001f16:	687b      	ldr	r3, [r7, #4]
 8001f18:	681b      	ldr	r3, [r3, #0]
 8001f1a:	3314      	adds	r3, #20
 8001f1c:	f8c7 309c 	str.w	r3, [r7, #156]	; 0x9c
 8001f20:	f8d7 309c 	ldr.w	r3, [r7, #156]	; 0x9c
 8001f24:	e853 3f00 	ldrex	r3, [r3]
 8001f28:	f8c7 3098 	str.w	r3, [r7, #152]	; 0x98
 8001f2c:	f8d7 3098 	ldr.w	r3, [r7, #152]	; 0x98
 8001f30:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 8001f34:	f8c7 30d0 	str.w	r3, [r7, #208]	; 0xd0
 8001f38:	687b      	ldr	r3, [r7, #4]
 8001f3a:	681b      	ldr	r3, [r3, #0]
 8001f3c:	3314      	adds	r3, #20
 8001f3e:	f8d7 20d0 	ldr.w	r2, [r7, #208]	; 0xd0
 8001f42:	f8c7 20a8 	str.w	r2, [r7, #168]	; 0xa8
 8001f46:	f8c7 30a4 	str.w	r3, [r7, #164]	; 0xa4
 8001f4a:	f8d7 10a4 	ldr.w	r1, [r7, #164]	; 0xa4
 8001f4e:	f8d7 20a8 	ldr.w	r2, [r7, #168]	; 0xa8
 8001f52:	e841 2300 	strex	r3, r2, [r1]
 8001f56:	f8c7 30a0 	str.w	r3, [r7, #160]	; 0xa0
 8001f5a:	f8d7 30a0 	ldr.w	r3, [r7, #160]	; 0xa0
 8001f5e:	2b00      	cmp	r3, #0
 8001f60:	d1d9      	bne.n	8001f16 <HAL_UART_IRQHandler+0x18e>
 8001f62:	687b      	ldr	r3, [r7, #4]
 8001f64:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8001f66:	2b00      	cmp	r3, #0
 8001f68:	d013      	beq.n	8001f92 <HAL_UART_IRQHandler+0x20a>
 8001f6a:	687b      	ldr	r3, [r7, #4]
 8001f6c:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8001f6e:	4a7e      	ldr	r2, [pc, #504]	; (8002168 <HAL_UART_IRQHandler+0x3e0>)
 8001f70:	635a      	str	r2, [r3, #52]	; 0x34
 8001f72:	687b      	ldr	r3, [r7, #4]
 8001f74:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8001f76:	4618      	mov	r0, r3
 8001f78:	f7fe fc46 	bl	8000808 <HAL_DMA_Abort_IT>
 8001f7c:	4603      	mov	r3, r0
 8001f7e:	2b00      	cmp	r3, #0
 8001f80:	d016      	beq.n	8001fb0 <HAL_UART_IRQHandler+0x228>
 8001f82:	687b      	ldr	r3, [r7, #4]
 8001f84:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8001f86:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8001f88:	687a      	ldr	r2, [r7, #4]
 8001f8a:	6bd2      	ldr	r2, [r2, #60]	; 0x3c
 8001f8c:	4610      	mov	r0, r2
 8001f8e:	4798      	blx	r3
 8001f90:	e00e      	b.n	8001fb0 <HAL_UART_IRQHandler+0x228>
 8001f92:	6878      	ldr	r0, [r7, #4]
 8001f94:	f000 f993 	bl	80022be <HAL_UART_ErrorCallback>
 8001f98:	e00a      	b.n	8001fb0 <HAL_UART_IRQHandler+0x228>
 8001f9a:	6878      	ldr	r0, [r7, #4]
 8001f9c:	f000 f98f 	bl	80022be <HAL_UART_ErrorCallback>
 8001fa0:	e006      	b.n	8001fb0 <HAL_UART_IRQHandler+0x228>
 8001fa2:	6878      	ldr	r0, [r7, #4]
 8001fa4:	f000 f98b 	bl	80022be <HAL_UART_ErrorCallback>
 8001fa8:	687b      	ldr	r3, [r7, #4]
 8001faa:	2200      	movs	r2, #0
 8001fac:	645a      	str	r2, [r3, #68]	; 0x44
 8001fae:	e175      	b.n	800229c <HAL_UART_IRQHandler+0x514>
 8001fb0:	bf00      	nop
 8001fb2:	e173      	b.n	800229c <HAL_UART_IRQHandler+0x514>
 8001fb4:	687b      	ldr	r3, [r7, #4]
 8001fb6:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8001fb8:	2b01      	cmp	r3, #1
 8001fba:	f040 814f 	bne.w	800225c <HAL_UART_IRQHandler+0x4d4>
 8001fbe:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8001fc2:	f003 0310 	and.w	r3, r3, #16
 8001fc6:	2b00      	cmp	r3, #0
 8001fc8:	f000 8148 	beq.w	800225c <HAL_UART_IRQHandler+0x4d4>
 8001fcc:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 8001fd0:	f003 0310 	and.w	r3, r3, #16
 8001fd4:	2b00      	cmp	r3, #0
 8001fd6:	f000 8141 	beq.w	800225c <HAL_UART_IRQHandler+0x4d4>
 8001fda:	2300      	movs	r3, #0
 8001fdc:	60bb      	str	r3, [r7, #8]
 8001fde:	687b      	ldr	r3, [r7, #4]
 8001fe0:	681b      	ldr	r3, [r3, #0]
 8001fe2:	681b      	ldr	r3, [r3, #0]
 8001fe4:	60bb      	str	r3, [r7, #8]
 8001fe6:	687b      	ldr	r3, [r7, #4]
 8001fe8:	681b      	ldr	r3, [r3, #0]
 8001fea:	685b      	ldr	r3, [r3, #4]
 8001fec:	60bb      	str	r3, [r7, #8]
 8001fee:	68bb      	ldr	r3, [r7, #8]
 8001ff0:	687b      	ldr	r3, [r7, #4]
 8001ff2:	681b      	ldr	r3, [r3, #0]
 8001ff4:	695b      	ldr	r3, [r3, #20]
 8001ff6:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8001ffa:	2b00      	cmp	r3, #0
 8001ffc:	f000 80b6 	beq.w	800216c <HAL_UART_IRQHandler+0x3e4>
 8002000:	687b      	ldr	r3, [r7, #4]
 8002002:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8002004:	681b      	ldr	r3, [r3, #0]
 8002006:	685b      	ldr	r3, [r3, #4]
 8002008:	f8a7 30be 	strh.w	r3, [r7, #190]	; 0xbe
 800200c:	f8b7 30be 	ldrh.w	r3, [r7, #190]	; 0xbe
 8002010:	2b00      	cmp	r3, #0
 8002012:	f000 8145 	beq.w	80022a0 <HAL_UART_IRQHandler+0x518>
 8002016:	687b      	ldr	r3, [r7, #4]
 8002018:	8d9b      	ldrh	r3, [r3, #44]	; 0x2c
 800201a:	f8b7 20be 	ldrh.w	r2, [r7, #190]	; 0xbe
 800201e:	429a      	cmp	r2, r3
 8002020:	f080 813e 	bcs.w	80022a0 <HAL_UART_IRQHandler+0x518>
 8002024:	687b      	ldr	r3, [r7, #4]
 8002026:	f8b7 20be 	ldrh.w	r2, [r7, #190]	; 0xbe
 800202a:	85da      	strh	r2, [r3, #46]	; 0x2e
 800202c:	687b      	ldr	r3, [r7, #4]
 800202e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8002030:	699b      	ldr	r3, [r3, #24]
 8002032:	2b20      	cmp	r3, #32
 8002034:	f000 8088 	beq.w	8002148 <HAL_UART_IRQHandler+0x3c0>
 8002038:	687b      	ldr	r3, [r7, #4]
 800203a:	681b      	ldr	r3, [r3, #0]
 800203c:	330c      	adds	r3, #12
 800203e:	f8c7 3088 	str.w	r3, [r7, #136]	; 0x88
 8002042:	f8d7 3088 	ldr.w	r3, [r7, #136]	; 0x88
 8002046:	e853 3f00 	ldrex	r3, [r3]
 800204a:	f8c7 3084 	str.w	r3, [r7, #132]	; 0x84
 800204e:	f8d7 3084 	ldr.w	r3, [r7, #132]	; 0x84
 8002052:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 8002056:	f8c7 30b8 	str.w	r3, [r7, #184]	; 0xb8
 800205a:	687b      	ldr	r3, [r7, #4]
 800205c:	681b      	ldr	r3, [r3, #0]
 800205e:	330c      	adds	r3, #12
 8002060:	f8d7 20b8 	ldr.w	r2, [r7, #184]	; 0xb8
 8002064:	f8c7 2094 	str.w	r2, [r7, #148]	; 0x94
 8002068:	f8c7 3090 	str.w	r3, [r7, #144]	; 0x90
 800206c:	f8d7 1090 	ldr.w	r1, [r7, #144]	; 0x90
 8002070:	f8d7 2094 	ldr.w	r2, [r7, #148]	; 0x94
 8002074:	e841 2300 	strex	r3, r2, [r1]
 8002078:	f8c7 308c 	str.w	r3, [r7, #140]	; 0x8c
 800207c:	f8d7 308c 	ldr.w	r3, [r7, #140]	; 0x8c
 8002080:	2b00      	cmp	r3, #0
 8002082:	d1d9      	bne.n	8002038 <HAL_UART_IRQHandler+0x2b0>
 8002084:	687b      	ldr	r3, [r7, #4]
 8002086:	681b      	ldr	r3, [r3, #0]
 8002088:	3314      	adds	r3, #20
 800208a:	677b      	str	r3, [r7, #116]	; 0x74
 800208c:	6f7b      	ldr	r3, [r7, #116]	; 0x74
 800208e:	e853 3f00 	ldrex	r3, [r3]
 8002092:	673b      	str	r3, [r7, #112]	; 0x70
 8002094:	6f3b      	ldr	r3, [r7, #112]	; 0x70
 8002096:	f023 0301 	bic.w	r3, r3, #1
 800209a:	f8c7 30b4 	str.w	r3, [r7, #180]	; 0xb4
 800209e:	687b      	ldr	r3, [r7, #4]
 80020a0:	681b      	ldr	r3, [r3, #0]
 80020a2:	3314      	adds	r3, #20
 80020a4:	f8d7 20b4 	ldr.w	r2, [r7, #180]	; 0xb4
 80020a8:	f8c7 2080 	str.w	r2, [r7, #128]	; 0x80
 80020ac:	67fb      	str	r3, [r7, #124]	; 0x7c
 80020ae:	6ff9      	ldr	r1, [r7, #124]	; 0x7c
 80020b0:	f8d7 2080 	ldr.w	r2, [r7, #128]	; 0x80
 80020b4:	e841 2300 	strex	r3, r2, [r1]
 80020b8:	67bb      	str	r3, [r7, #120]	; 0x78
 80020ba:	6fbb      	ldr	r3, [r7, #120]	; 0x78
 80020bc:	2b00      	cmp	r3, #0
 80020be:	d1e1      	bne.n	8002084 <HAL_UART_IRQHandler+0x2fc>
 80020c0:	687b      	ldr	r3, [r7, #4]
 80020c2:	681b      	ldr	r3, [r3, #0]
 80020c4:	3314      	adds	r3, #20
 80020c6:	663b      	str	r3, [r7, #96]	; 0x60
 80020c8:	6e3b      	ldr	r3, [r7, #96]	; 0x60
 80020ca:	e853 3f00 	ldrex	r3, [r3]
 80020ce:	65fb      	str	r3, [r7, #92]	; 0x5c
 80020d0:	6dfb      	ldr	r3, [r7, #92]	; 0x5c
 80020d2:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 80020d6:	f8c7 30b0 	str.w	r3, [r7, #176]	; 0xb0
 80020da:	687b      	ldr	r3, [r7, #4]
 80020dc:	681b      	ldr	r3, [r3, #0]
 80020de:	3314      	adds	r3, #20
 80020e0:	f8d7 20b0 	ldr.w	r2, [r7, #176]	; 0xb0
 80020e4:	66fa      	str	r2, [r7, #108]	; 0x6c
 80020e6:	66bb      	str	r3, [r7, #104]	; 0x68
 80020e8:	6eb9      	ldr	r1, [r7, #104]	; 0x68
 80020ea:	6efa      	ldr	r2, [r7, #108]	; 0x6c
 80020ec:	e841 2300 	strex	r3, r2, [r1]
 80020f0:	667b      	str	r3, [r7, #100]	; 0x64
 80020f2:	6e7b      	ldr	r3, [r7, #100]	; 0x64
 80020f4:	2b00      	cmp	r3, #0
 80020f6:	d1e3      	bne.n	80020c0 <HAL_UART_IRQHandler+0x338>
 80020f8:	687b      	ldr	r3, [r7, #4]
 80020fa:	2220      	movs	r2, #32
 80020fc:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
 8002100:	687b      	ldr	r3, [r7, #4]
 8002102:	2200      	movs	r2, #0
 8002104:	631a      	str	r2, [r3, #48]	; 0x30
 8002106:	687b      	ldr	r3, [r7, #4]
 8002108:	681b      	ldr	r3, [r3, #0]
 800210a:	330c      	adds	r3, #12
 800210c:	64fb      	str	r3, [r7, #76]	; 0x4c
 800210e:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8002110:	e853 3f00 	ldrex	r3, [r3]
 8002114:	64bb      	str	r3, [r7, #72]	; 0x48
 8002116:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8002118:	f023 0310 	bic.w	r3, r3, #16
 800211c:	f8c7 30ac 	str.w	r3, [r7, #172]	; 0xac
 8002120:	687b      	ldr	r3, [r7, #4]
 8002122:	681b      	ldr	r3, [r3, #0]
 8002124:	330c      	adds	r3, #12
 8002126:	f8d7 20ac 	ldr.w	r2, [r7, #172]	; 0xac
 800212a:	65ba      	str	r2, [r7, #88]	; 0x58
 800212c:	657b      	str	r3, [r7, #84]	; 0x54
 800212e:	6d79      	ldr	r1, [r7, #84]	; 0x54
 8002130:	6dba      	ldr	r2, [r7, #88]	; 0x58
 8002132:	e841 2300 	strex	r3, r2, [r1]
 8002136:	653b      	str	r3, [r7, #80]	; 0x50
 8002138:	6d3b      	ldr	r3, [r7, #80]	; 0x50
 800213a:	2b00      	cmp	r3, #0
 800213c:	d1e3      	bne.n	8002106 <HAL_UART_IRQHandler+0x37e>
 800213e:	687b      	ldr	r3, [r7, #4]
 8002140:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8002142:	4618      	mov	r0, r3
 8002144:	f7fe fb25 	bl	8000792 <HAL_DMA_Abort>
 8002148:	687b      	ldr	r3, [r7, #4]
 800214a:	2202      	movs	r2, #2
 800214c:	635a      	str	r2, [r3, #52]	; 0x34
 800214e:	687b      	ldr	r3, [r7, #4]
 8002150:	8d9a      	ldrh	r2, [r3, #44]	; 0x2c
 8002152:	687b      	ldr	r3, [r7, #4]
 8002154:	8ddb      	ldrh	r3, [r3, #46]	; 0x2e
 8002156:	b29b      	uxth	r3, r3
 8002158:	1ad3      	subs	r3, r2, r3
 800215a:	b29b      	uxth	r3, r3
 800215c:	4619      	mov	r1, r3
 800215e:	6878      	ldr	r0, [r7, #4]
 8002160:	f000 f8b6 	bl	80022d0 <HAL_UARTEx_RxEventCallback>
 8002164:	e09c      	b.n	80022a0 <HAL_UART_IRQHandler+0x518>
 8002166:	bf00      	nop
 8002168:	0800241d 	.word	0x0800241d
 800216c:	687b      	ldr	r3, [r7, #4]
 800216e:	8d9a      	ldrh	r2, [r3, #44]	; 0x2c
 8002170:	687b      	ldr	r3, [r7, #4]
 8002172:	8ddb      	ldrh	r3, [r3, #46]	; 0x2e
 8002174:	b29b      	uxth	r3, r3
 8002176:	1ad3      	subs	r3, r2, r3
 8002178:	f8a7 30ce 	strh.w	r3, [r7, #206]	; 0xce
 800217c:	687b      	ldr	r3, [r7, #4]
 800217e:	8ddb      	ldrh	r3, [r3, #46]	; 0x2e
 8002180:	b29b      	uxth	r3, r3
 8002182:	2b00      	cmp	r3, #0
 8002184:	f000 808e 	beq.w	80022a4 <HAL_UART_IRQHandler+0x51c>
 8002188:	f8b7 30ce 	ldrh.w	r3, [r7, #206]	; 0xce
 800218c:	2b00      	cmp	r3, #0
 800218e:	f000 8089 	beq.w	80022a4 <HAL_UART_IRQHandler+0x51c>
 8002192:	687b      	ldr	r3, [r7, #4]
 8002194:	681b      	ldr	r3, [r3, #0]
 8002196:	330c      	adds	r3, #12
 8002198:	63bb      	str	r3, [r7, #56]	; 0x38
 800219a:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800219c:	e853 3f00 	ldrex	r3, [r3]
 80021a0:	637b      	str	r3, [r7, #52]	; 0x34
 80021a2:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80021a4:	f423 7390 	bic.w	r3, r3, #288	; 0x120
 80021a8:	f8c7 30c8 	str.w	r3, [r7, #200]	; 0xc8
 80021ac:	687b      	ldr	r3, [r7, #4]
 80021ae:	681b      	ldr	r3, [r3, #0]
 80021b0:	330c      	adds	r3, #12
 80021b2:	f8d7 20c8 	ldr.w	r2, [r7, #200]	; 0xc8
 80021b6:	647a      	str	r2, [r7, #68]	; 0x44
 80021b8:	643b      	str	r3, [r7, #64]	; 0x40
 80021ba:	6c39      	ldr	r1, [r7, #64]	; 0x40
 80021bc:	6c7a      	ldr	r2, [r7, #68]	; 0x44
 80021be:	e841 2300 	strex	r3, r2, [r1]
 80021c2:	63fb      	str	r3, [r7, #60]	; 0x3c
 80021c4:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 80021c6:	2b00      	cmp	r3, #0
 80021c8:	d1e3      	bne.n	8002192 <HAL_UART_IRQHandler+0x40a>
 80021ca:	687b      	ldr	r3, [r7, #4]
 80021cc:	681b      	ldr	r3, [r3, #0]
 80021ce:	3314      	adds	r3, #20
 80021d0:	627b      	str	r3, [r7, #36]	; 0x24
 80021d2:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80021d4:	e853 3f00 	ldrex	r3, [r3]
 80021d8:	623b      	str	r3, [r7, #32]
 80021da:	6a3b      	ldr	r3, [r7, #32]
 80021dc:	f023 0301 	bic.w	r3, r3, #1
 80021e0:	f8c7 30c4 	str.w	r3, [r7, #196]	; 0xc4
 80021e4:	687b      	ldr	r3, [r7, #4]
 80021e6:	681b      	ldr	r3, [r3, #0]
 80021e8:	3314      	adds	r3, #20
 80021ea:	f8d7 20c4 	ldr.w	r2, [r7, #196]	; 0xc4
 80021ee:	633a      	str	r2, [r7, #48]	; 0x30
 80021f0:	62fb      	str	r3, [r7, #44]	; 0x2c
 80021f2:	6af9      	ldr	r1, [r7, #44]	; 0x2c
 80021f4:	6b3a      	ldr	r2, [r7, #48]	; 0x30
 80021f6:	e841 2300 	strex	r3, r2, [r1]
 80021fa:	62bb      	str	r3, [r7, #40]	; 0x28
 80021fc:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80021fe:	2b00      	cmp	r3, #0
 8002200:	d1e3      	bne.n	80021ca <HAL_UART_IRQHandler+0x442>
 8002202:	687b      	ldr	r3, [r7, #4]
 8002204:	2220      	movs	r2, #32
 8002206:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
 800220a:	687b      	ldr	r3, [r7, #4]
 800220c:	2200      	movs	r2, #0
 800220e:	631a      	str	r2, [r3, #48]	; 0x30
 8002210:	687b      	ldr	r3, [r7, #4]
 8002212:	681b      	ldr	r3, [r3, #0]
 8002214:	330c      	adds	r3, #12
 8002216:	613b      	str	r3, [r7, #16]
 8002218:	693b      	ldr	r3, [r7, #16]
 800221a:	e853 3f00 	ldrex	r3, [r3]
 800221e:	60fb      	str	r3, [r7, #12]
 8002220:	68fb      	ldr	r3, [r7, #12]
 8002222:	f023 0310 	bic.w	r3, r3, #16
 8002226:	f8c7 30c0 	str.w	r3, [r7, #192]	; 0xc0
 800222a:	687b      	ldr	r3, [r7, #4]
 800222c:	681b      	ldr	r3, [r3, #0]
 800222e:	330c      	adds	r3, #12
 8002230:	f8d7 20c0 	ldr.w	r2, [r7, #192]	; 0xc0
 8002234:	61fa      	str	r2, [r7, #28]
 8002236:	61bb      	str	r3, [r7, #24]
 8002238:	69b9      	ldr	r1, [r7, #24]
 800223a:	69fa      	ldr	r2, [r7, #28]
 800223c:	e841 2300 	strex	r3, r2, [r1]
 8002240:	617b      	str	r3, [r7, #20]
 8002242:	697b      	ldr	r3, [r7, #20]
 8002244:	2b00      	cmp	r3, #0
 8002246:	d1e3      	bne.n	8002210 <HAL_UART_IRQHandler+0x488>
 8002248:	687b      	ldr	r3, [r7, #4]
 800224a:	2202      	movs	r2, #2
 800224c:	635a      	str	r2, [r3, #52]	; 0x34
 800224e:	f8b7 30ce 	ldrh.w	r3, [r7, #206]	; 0xce
 8002252:	4619      	mov	r1, r3
 8002254:	6878      	ldr	r0, [r7, #4]
 8002256:	f000 f83b 	bl	80022d0 <HAL_UARTEx_RxEventCallback>
 800225a:	e023      	b.n	80022a4 <HAL_UART_IRQHandler+0x51c>
 800225c:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8002260:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8002264:	2b00      	cmp	r3, #0
 8002266:	d009      	beq.n	800227c <HAL_UART_IRQHandler+0x4f4>
 8002268:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 800226c:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8002270:	2b00      	cmp	r3, #0
 8002272:	d003      	beq.n	800227c <HAL_UART_IRQHandler+0x4f4>
 8002274:	6878      	ldr	r0, [r7, #4]
 8002276:	f000 f8e5 	bl	8002444 <UART_Transmit_IT>
 800227a:	e014      	b.n	80022a6 <HAL_UART_IRQHandler+0x51e>
 800227c:	f8d7 30e4 	ldr.w	r3, [r7, #228]	; 0xe4
 8002280:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8002284:	2b00      	cmp	r3, #0
 8002286:	d00e      	beq.n	80022a6 <HAL_UART_IRQHandler+0x51e>
 8002288:	f8d7 30e0 	ldr.w	r3, [r7, #224]	; 0xe0
 800228c:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8002290:	2b00      	cmp	r3, #0
 8002292:	d008      	beq.n	80022a6 <HAL_UART_IRQHandler+0x51e>
 8002294:	6878      	ldr	r0, [r7, #4]
 8002296:	f000 f924 	bl	80024e2 <UART_EndTransmit_IT>
 800229a:	e004      	b.n	80022a6 <HAL_UART_IRQHandler+0x51e>
 800229c:	bf00      	nop
 800229e:	e002      	b.n	80022a6 <HAL_UART_IRQHandler+0x51e>
 80022a0:	bf00      	nop
 80022a2:	e000      	b.n	80022a6 <HAL_UART_IRQHandler+0x51e>
 80022a4:	bf00      	nop
 80022a6:	37e8      	adds	r7, #232	; 0xe8
 80022a8:	46bd      	mov	sp, r7
 80022aa:	bd80      	pop	{r7, pc}

080022ac <HAL_UART_TxCpltCallback>:
 80022ac:	b480      	push	{r7}
 80022ae:	b083      	sub	sp, #12
 80022b0:	af00      	add	r7, sp, #0
 80022b2:	6078      	str	r0, [r7, #4]
 80022b4:	bf00      	nop
 80022b6:	370c      	adds	r7, #12
 80022b8:	46bd      	mov	sp, r7
 80022ba:	bc80      	pop	{r7}
 80022bc:	4770      	bx	lr

080022be <HAL_UART_ErrorCallback>:
 80022be:	b480      	push	{r7}
 80022c0:	b083      	sub	sp, #12
 80022c2:	af00      	add	r7, sp, #0
 80022c4:	6078      	str	r0, [r7, #4]
 80022c6:	bf00      	nop
 80022c8:	370c      	adds	r7, #12
 80022ca:	46bd      	mov	sp, r7
 80022cc:	bc80      	pop	{r7}
 80022ce:	4770      	bx	lr

080022d0 <HAL_UARTEx_RxEventCallback>:
 80022d0:	b480      	push	{r7}
 80022d2:	b083      	sub	sp, #12
 80022d4:	af00      	add	r7, sp, #0
 80022d6:	6078      	str	r0, [r7, #4]
 80022d8:	460b      	mov	r3, r1
 80022da:	807b      	strh	r3, [r7, #2]
 80022dc:	bf00      	nop
 80022de:	370c      	adds	r7, #12
 80022e0:	46bd      	mov	sp, r7
 80022e2:	bc80      	pop	{r7}
 80022e4:	4770      	bx	lr

080022e6 <UART_Start_Receive_IT>:
 80022e6:	b480      	push	{r7}
 80022e8:	b085      	sub	sp, #20
 80022ea:	af00      	add	r7, sp, #0
 80022ec:	60f8      	str	r0, [r7, #12]
 80022ee:	60b9      	str	r1, [r7, #8]
 80022f0:	4613      	mov	r3, r2
 80022f2:	80fb      	strh	r3, [r7, #6]
 80022f4:	68fb      	ldr	r3, [r7, #12]
 80022f6:	68ba      	ldr	r2, [r7, #8]
 80022f8:	629a      	str	r2, [r3, #40]	; 0x28
 80022fa:	68fb      	ldr	r3, [r7, #12]
 80022fc:	88fa      	ldrh	r2, [r7, #6]
 80022fe:	859a      	strh	r2, [r3, #44]	; 0x2c
 8002300:	68fb      	ldr	r3, [r7, #12]
 8002302:	88fa      	ldrh	r2, [r7, #6]
 8002304:	85da      	strh	r2, [r3, #46]	; 0x2e
 8002306:	68fb      	ldr	r3, [r7, #12]
 8002308:	2200      	movs	r2, #0
 800230a:	645a      	str	r2, [r3, #68]	; 0x44
 800230c:	68fb      	ldr	r3, [r7, #12]
 800230e:	2222      	movs	r2, #34	; 0x22
 8002310:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
 8002314:	68fb      	ldr	r3, [r7, #12]
 8002316:	691b      	ldr	r3, [r3, #16]
 8002318:	2b00      	cmp	r3, #0
 800231a:	d007      	beq.n	800232c <UART_Start_Receive_IT+0x46>
 800231c:	68fb      	ldr	r3, [r7, #12]
 800231e:	681b      	ldr	r3, [r3, #0]
 8002320:	68da      	ldr	r2, [r3, #12]
 8002322:	68fb      	ldr	r3, [r7, #12]
 8002324:	681b      	ldr	r3, [r3, #0]
 8002326:	f442 7280 	orr.w	r2, r2, #256	; 0x100
 800232a:	60da      	str	r2, [r3, #12]
 800232c:	68fb      	ldr	r3, [r7, #12]
 800232e:	681b      	ldr	r3, [r3, #0]
 8002330:	695a      	ldr	r2, [r3, #20]
 8002332:	68fb      	ldr	r3, [r7, #12]
 8002334:	681b      	ldr	r3, [r3, #0]
 8002336:	f042 0201 	orr.w	r2, r2, #1
 800233a:	615a      	str	r2, [r3, #20]
 800233c:	68fb      	ldr	r3, [r7, #12]
 800233e:	681b      	ldr	r3, [r3, #0]
 8002340:	68da      	ldr	r2, [r3, #12]
 8002342:	68fb      	ldr	r3, [r7, #12]
 8002344:	681b      	ldr	r3, [r3, #0]
 8002346:	f042 0220 	orr.w	r2, r2, #32
 800234a:	60da      	str	r2, [r3, #12]
 800234c:	2300      	movs	r3, #0
 800234e:	4618      	mov	r0, r3
 8002350:	3714      	adds	r7, #20
 8002352:	46bd      	mov	sp, r7
 8002354:	bc80      	pop	{r7}
 8002356:	4770      	bx	lr

08002358 <UART_EndRxTransfer>:
 8002358:	b480      	push	{r7}
 800235a:	b095      	sub	sp, #84	; 0x54
 800235c:	af00      	add	r7, sp, #0
 800235e:	6078      	str	r0, [r7, #4]
 8002360:	687b      	ldr	r3, [r7, #4]
 8002362:	681b      	ldr	r3, [r3, #0]
 8002364:	330c      	adds	r3, #12
 8002366:	637b      	str	r3, [r7, #52]	; 0x34
 8002368:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 800236a:	e853 3f00 	ldrex	r3, [r3]
 800236e:	633b      	str	r3, [r7, #48]	; 0x30
 8002370:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8002372:	f423 7390 	bic.w	r3, r3, #288	; 0x120
 8002376:	64fb      	str	r3, [r7, #76]	; 0x4c
 8002378:	687b      	ldr	r3, [r7, #4]
 800237a:	681b      	ldr	r3, [r3, #0]
 800237c:	330c      	adds	r3, #12
 800237e:	6cfa      	ldr	r2, [r7, #76]	; 0x4c
 8002380:	643a      	str	r2, [r7, #64]	; 0x40
 8002382:	63fb      	str	r3, [r7, #60]	; 0x3c
 8002384:	6bf9      	ldr	r1, [r7, #60]	; 0x3c
 8002386:	6c3a      	ldr	r2, [r7, #64]	; 0x40
 8002388:	e841 2300 	strex	r3, r2, [r1]
 800238c:	63bb      	str	r3, [r7, #56]	; 0x38
 800238e:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8002390:	2b00      	cmp	r3, #0
 8002392:	d1e5      	bne.n	8002360 <UART_EndRxTransfer+0x8>
 8002394:	687b      	ldr	r3, [r7, #4]
 8002396:	681b      	ldr	r3, [r3, #0]
 8002398:	3314      	adds	r3, #20
 800239a:	623b      	str	r3, [r7, #32]
 800239c:	6a3b      	ldr	r3, [r7, #32]
 800239e:	e853 3f00 	ldrex	r3, [r3]
 80023a2:	61fb      	str	r3, [r7, #28]
 80023a4:	69fb      	ldr	r3, [r7, #28]
 80023a6:	f023 0301 	bic.w	r3, r3, #1
 80023aa:	64bb      	str	r3, [r7, #72]	; 0x48
 80023ac:	687b      	ldr	r3, [r7, #4]
 80023ae:	681b      	ldr	r3, [r3, #0]
 80023b0:	3314      	adds	r3, #20
 80023b2:	6cba      	ldr	r2, [r7, #72]	; 0x48
 80023b4:	62fa      	str	r2, [r7, #44]	; 0x2c
 80023b6:	62bb      	str	r3, [r7, #40]	; 0x28
 80023b8:	6ab9      	ldr	r1, [r7, #40]	; 0x28
 80023ba:	6afa      	ldr	r2, [r7, #44]	; 0x2c
 80023bc:	e841 2300 	strex	r3, r2, [r1]
 80023c0:	627b      	str	r3, [r7, #36]	; 0x24
 80023c2:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80023c4:	2b00      	cmp	r3, #0
 80023c6:	d1e5      	bne.n	8002394 <UART_EndRxTransfer+0x3c>
 80023c8:	687b      	ldr	r3, [r7, #4]
 80023ca:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80023cc:	2b01      	cmp	r3, #1
 80023ce:	d119      	bne.n	8002404 <UART_EndRxTransfer+0xac>
 80023d0:	687b      	ldr	r3, [r7, #4]
 80023d2:	681b      	ldr	r3, [r3, #0]
 80023d4:	330c      	adds	r3, #12
 80023d6:	60fb      	str	r3, [r7, #12]
 80023d8:	68fb      	ldr	r3, [r7, #12]
 80023da:	e853 3f00 	ldrex	r3, [r3]
 80023de:	60bb      	str	r3, [r7, #8]
 80023e0:	68bb      	ldr	r3, [r7, #8]
 80023e2:	f023 0310 	bic.w	r3, r3, #16
 80023e6:	647b      	str	r3, [r7, #68]	; 0x44
 80023e8:	687b      	ldr	r3, [r7, #4]
 80023ea:	681b      	ldr	r3, [r3, #0]
 80023ec:	330c      	adds	r3, #12
 80023ee:	6c7a      	ldr	r2, [r7, #68]	; 0x44
 80023f0:	61ba      	str	r2, [r7, #24]
 80023f2:	617b      	str	r3, [r7, #20]
 80023f4:	6979      	ldr	r1, [r7, #20]
 80023f6:	69ba      	ldr	r2, [r7, #24]
 80023f8:	e841 2300 	strex	r3, r2, [r1]
 80023fc:	613b      	str	r3, [r7, #16]
 80023fe:	693b      	ldr	r3, [r7, #16]
 8002400:	2b00      	cmp	r3, #0
 8002402:	d1e5      	bne.n	80023d0 <UART_EndRxTransfer+0x78>
 8002404:	687b      	ldr	r3, [r7, #4]
 8002406:	2220      	movs	r2, #32
 8002408:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
 800240c:	687b      	ldr	r3, [r7, #4]
 800240e:	2200      	movs	r2, #0
 8002410:	631a      	str	r2, [r3, #48]	; 0x30
 8002412:	bf00      	nop
 8002414:	3754      	adds	r7, #84	; 0x54
 8002416:	46bd      	mov	sp, r7
 8002418:	bc80      	pop	{r7}
 800241a:	4770      	bx	lr

0800241c <UART_DMAAbortOnError>:
 800241c:	b580      	push	{r7, lr}
 800241e:	b084      	sub	sp, #16
 8002420:	af00      	add	r7, sp, #0
 8002422:	6078      	str	r0, [r7, #4]
 8002424:	687b      	ldr	r3, [r7, #4]
 8002426:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8002428:	60fb      	str	r3, [r7, #12]
 800242a:	68fb      	ldr	r3, [r7, #12]
 800242c:	2200      	movs	r2, #0
 800242e:	85da      	strh	r2, [r3, #46]	; 0x2e
 8002430:	68fb      	ldr	r3, [r7, #12]
 8002432:	2200      	movs	r2, #0
 8002434:	84da      	strh	r2, [r3, #38]	; 0x26
 8002436:	68f8      	ldr	r0, [r7, #12]
 8002438:	f7ff ff41 	bl	80022be <HAL_UART_ErrorCallback>
 800243c:	bf00      	nop
 800243e:	3710      	adds	r7, #16
 8002440:	46bd      	mov	sp, r7
 8002442:	bd80      	pop	{r7, pc}

08002444 <UART_Transmit_IT>:
 8002444:	b480      	push	{r7}
 8002446:	b085      	sub	sp, #20
 8002448:	af00      	add	r7, sp, #0
 800244a:	6078      	str	r0, [r7, #4]
 800244c:	687b      	ldr	r3, [r7, #4]
 800244e:	f893 3041 	ldrb.w	r3, [r3, #65]	; 0x41
 8002452:	b2db      	uxtb	r3, r3
 8002454:	2b21      	cmp	r3, #33	; 0x21
 8002456:	d13e      	bne.n	80024d6 <UART_Transmit_IT+0x92>
 8002458:	687b      	ldr	r3, [r7, #4]
 800245a:	689b      	ldr	r3, [r3, #8]
 800245c:	f5b3 5f80 	cmp.w	r3, #4096	; 0x1000
 8002460:	d114      	bne.n	800248c <UART_Transmit_IT+0x48>
 8002462:	687b      	ldr	r3, [r7, #4]
 8002464:	691b      	ldr	r3, [r3, #16]
 8002466:	2b00      	cmp	r3, #0
 8002468:	d110      	bne.n	800248c <UART_Transmit_IT+0x48>
 800246a:	687b      	ldr	r3, [r7, #4]
 800246c:	6a1b      	ldr	r3, [r3, #32]
 800246e:	60fb      	str	r3, [r7, #12]
 8002470:	68fb      	ldr	r3, [r7, #12]
 8002472:	881b      	ldrh	r3, [r3, #0]
 8002474:	461a      	mov	r2, r3
 8002476:	687b      	ldr	r3, [r7, #4]
 8002478:	681b      	ldr	r3, [r3, #0]
 800247a:	f3c2 0208 	ubfx	r2, r2, #0, #9
 800247e:	605a      	str	r2, [r3, #4]
 8002480:	687b      	ldr	r3, [r7, #4]
 8002482:	6a1b      	ldr	r3, [r3, #32]
 8002484:	1c9a      	adds	r2, r3, #2
 8002486:	687b      	ldr	r3, [r7, #4]
 8002488:	621a      	str	r2, [r3, #32]
 800248a:	e008      	b.n	800249e <UART_Transmit_IT+0x5a>
 800248c:	687b      	ldr	r3, [r7, #4]
 800248e:	6a1b      	ldr	r3, [r3, #32]
 8002490:	1c59      	adds	r1, r3, #1
 8002492:	687a      	ldr	r2, [r7, #4]
 8002494:	6211      	str	r1, [r2, #32]
 8002496:	781a      	ldrb	r2, [r3, #0]
 8002498:	687b      	ldr	r3, [r7, #4]
 800249a:	681b      	ldr	r3, [r3, #0]
 800249c:	605a      	str	r2, [r3, #4]
 800249e:	687b      	ldr	r3, [r7, #4]
 80024a0:	8cdb      	ldrh	r3, [r3, #38]	; 0x26
 80024a2:	b29b      	uxth	r3, r3
 80024a4:	3b01      	subs	r3, #1
 80024a6:	b29b      	uxth	r3, r3
 80024a8:	687a      	ldr	r2, [r7, #4]
 80024aa:	4619      	mov	r1, r3
 80024ac:	84d1      	strh	r1, [r2, #38]	; 0x26
 80024ae:	2b00      	cmp	r3, #0
 80024b0:	d10f      	bne.n	80024d2 <UART_Transmit_IT+0x8e>
 80024b2:	687b      	ldr	r3, [r7, #4]
 80024b4:	681b      	ldr	r3, [r3, #0]
 80024b6:	68da      	ldr	r2, [r3, #12]
 80024b8:	687b      	ldr	r3, [r7, #4]
 80024ba:	681b      	ldr	r3, [r3, #0]
 80024bc:	f022 0280 	bic.w	r2, r2, #128	; 0x80
 80024c0:	60da      	str	r2, [r3, #12]
 80024c2:	687b      	ldr	r3, [r7, #4]
 80024c4:	681b      	ldr	r3, [r3, #0]
 80024c6:	68da      	ldr	r2, [r3, #12]
 80024c8:	687b      	ldr	r3, [r7, #4]
 80024ca:	681b      	ldr	r3, [r3, #0]
 80024cc:	f042 0240 	orr.w	r2, r2, #64	; 0x40
 80024d0:	60da      	str	r2, [r3, #12]
 80024d2:	2300      	movs	r3, #0
 80024d4:	e000      	b.n	80024d8 <UART_Transmit_IT+0x94>
 80024d6:	2302      	movs	r3, #2
 80024d8:	4618      	mov	r0, r3
 80024da:	3714      	adds	r7, #20
 80024dc:	46bd      	mov	sp, r7
 80024de:	bc80      	pop	{r7}
 80024e0:	4770      	bx	lr

080024e2 <UART_EndTransmit_IT>:
 80024e2:	b580      	push	{r7, lr}
 80024e4:	b082      	sub	sp, #8
 80024e6:	af00      	add	r7, sp, #0
 80024e8:	6078      	str	r0, [r7, #4]
 80024ea:	687b      	ldr	r3, [r7, #4]
 80024ec:	681b      	ldr	r3, [r3, #0]
 80024ee:	68da      	ldr	r2, [r3, #12]
 80024f0:	687b      	ldr	r3, [r7, #4]
 80024f2:	681b      	ldr	r3, [r3, #0]
 80024f4:	f022 0240 	bic.w	r2, r2, #64	; 0x40
 80024f8:	60da      	str	r2, [r3, #12]
 80024fa:	687b      	ldr	r3, [r7, #4]
 80024fc:	2220      	movs	r2, #32
 80024fe:	f883 2041 	strb.w	r2, [r3, #65]	; 0x41
 8002502:	6878      	ldr	r0, [r7, #4]
 8002504:	f7ff fed2 	bl	80022ac <HAL_UART_TxCpltCallback>
 8002508:	2300      	movs	r3, #0
 800250a:	4618      	mov	r0, r3
 800250c:	3708      	adds	r7, #8
 800250e:	46bd      	mov	sp, r7
 8002510:	bd80      	pop	{r7, pc}

08002512 <UART_Receive_IT>:
 8002512:	b580      	push	{r7, lr}
 8002514:	b08c      	sub	sp, #48	; 0x30
 8002516:	af00      	add	r7, sp, #0
 8002518:	6078      	str	r0, [r7, #4]
 800251a:	687b      	ldr	r3, [r7, #4]
 800251c:	f893 3042 	ldrb.w	r3, [r3, #66]	; 0x42
 8002520:	b2db      	uxtb	r3, r3
 8002522:	2b22      	cmp	r3, #34	; 0x22
 8002524:	f040 80ae 	bne.w	8002684 <UART_Receive_IT+0x172>
 8002528:	687b      	ldr	r3, [r7, #4]
 800252a:	689b      	ldr	r3, [r3, #8]
 800252c:	f5b3 5f80 	cmp.w	r3, #4096	; 0x1000
 8002530:	d117      	bne.n	8002562 <UART_Receive_IT+0x50>
 8002532:	687b      	ldr	r3, [r7, #4]
 8002534:	691b      	ldr	r3, [r3, #16]
 8002536:	2b00      	cmp	r3, #0
 8002538:	d113      	bne.n	8002562 <UART_Receive_IT+0x50>
 800253a:	2300      	movs	r3, #0
 800253c:	62fb      	str	r3, [r7, #44]	; 0x2c
 800253e:	687b      	ldr	r3, [r7, #4]
 8002540:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 8002542:	62bb      	str	r3, [r7, #40]	; 0x28
 8002544:	687b      	ldr	r3, [r7, #4]
 8002546:	681b      	ldr	r3, [r3, #0]
 8002548:	685b      	ldr	r3, [r3, #4]
 800254a:	b29b      	uxth	r3, r3
 800254c:	f3c3 0308 	ubfx	r3, r3, #0, #9
 8002550:	b29a      	uxth	r2, r3
 8002552:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8002554:	801a      	strh	r2, [r3, #0]
 8002556:	687b      	ldr	r3, [r7, #4]
 8002558:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 800255a:	1c9a      	adds	r2, r3, #2
 800255c:	687b      	ldr	r3, [r7, #4]
 800255e:	629a      	str	r2, [r3, #40]	; 0x28
 8002560:	e026      	b.n	80025b0 <UART_Receive_IT+0x9e>
 8002562:	687b      	ldr	r3, [r7, #4]
 8002564:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 8002566:	62fb      	str	r3, [r7, #44]	; 0x2c
 8002568:	2300      	movs	r3, #0
 800256a:	62bb      	str	r3, [r7, #40]	; 0x28
 800256c:	687b      	ldr	r3, [r7, #4]
 800256e:	689b      	ldr	r3, [r3, #8]
 8002570:	f5b3 5f80 	cmp.w	r3, #4096	; 0x1000
 8002574:	d007      	beq.n	8002586 <UART_Receive_IT+0x74>
 8002576:	687b      	ldr	r3, [r7, #4]
 8002578:	689b      	ldr	r3, [r3, #8]
 800257a:	2b00      	cmp	r3, #0
 800257c:	d10a      	bne.n	8002594 <UART_Receive_IT+0x82>
 800257e:	687b      	ldr	r3, [r7, #4]
 8002580:	691b      	ldr	r3, [r3, #16]
 8002582:	2b00      	cmp	r3, #0
 8002584:	d106      	bne.n	8002594 <UART_Receive_IT+0x82>
 8002586:	687b      	ldr	r3, [r7, #4]
 8002588:	681b      	ldr	r3, [r3, #0]
 800258a:	685b      	ldr	r3, [r3, #4]
 800258c:	b2da      	uxtb	r2, r3
 800258e:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8002590:	701a      	strb	r2, [r3, #0]
 8002592:	e008      	b.n	80025a6 <UART_Receive_IT+0x94>
 8002594:	687b      	ldr	r3, [r7, #4]
 8002596:	681b      	ldr	r3, [r3, #0]
 8002598:	685b      	ldr	r3, [r3, #4]
 800259a:	b2db      	uxtb	r3, r3
 800259c:	f003 037f 	and.w	r3, r3, #127	; 0x7f
 80025a0:	b2da      	uxtb	r2, r3
 80025a2:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80025a4:	701a      	strb	r2, [r3, #0]
 80025a6:	687b      	ldr	r3, [r7, #4]
 80025a8:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 80025aa:	1c5a      	adds	r2, r3, #1
 80025ac:	687b      	ldr	r3, [r7, #4]
 80025ae:	629a      	str	r2, [r3, #40]	; 0x28
 80025b0:	687b      	ldr	r3, [r7, #4]
 80025b2:	8ddb      	ldrh	r3, [r3, #46]	; 0x2e
 80025b4:	b29b      	uxth	r3, r3
 80025b6:	3b01      	subs	r3, #1
 80025b8:	b29b      	uxth	r3, r3
 80025ba:	687a      	ldr	r2, [r7, #4]
 80025bc:	4619      	mov	r1, r3
 80025be:	85d1      	strh	r1, [r2, #46]	; 0x2e
 80025c0:	2b00      	cmp	r3, #0
 80025c2:	d15d      	bne.n	8002680 <UART_Receive_IT+0x16e>
 80025c4:	687b      	ldr	r3, [r7, #4]
 80025c6:	681b      	ldr	r3, [r3, #0]
 80025c8:	68da      	ldr	r2, [r3, #12]
 80025ca:	687b      	ldr	r3, [r7, #4]
 80025cc:	681b      	ldr	r3, [r3, #0]
 80025ce:	f022 0220 	bic.w	r2, r2, #32
 80025d2:	60da      	str	r2, [r3, #12]
 80025d4:	687b      	ldr	r3, [r7, #4]
 80025d6:	681b      	ldr	r3, [r3, #0]
 80025d8:	68da      	ldr	r2, [r3, #12]
 80025da:	687b      	ldr	r3, [r7, #4]
 80025dc:	681b      	ldr	r3, [r3, #0]
 80025de:	f422 7280 	bic.w	r2, r2, #256	; 0x100
 80025e2:	60da      	str	r2, [r3, #12]
 80025e4:	687b      	ldr	r3, [r7, #4]
 80025e6:	681b      	ldr	r3, [r3, #0]
 80025e8:	695a      	ldr	r2, [r3, #20]
 80025ea:	687b      	ldr	r3, [r7, #4]
 80025ec:	681b      	ldr	r3, [r3, #0]
 80025ee:	f022 0201 	bic.w	r2, r2, #1
 80025f2:	615a      	str	r2, [r3, #20]
 80025f4:	687b      	ldr	r3, [r7, #4]
 80025f6:	2220      	movs	r2, #32
 80025f8:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
 80025fc:	687b      	ldr	r3, [r7, #4]
 80025fe:	2200      	movs	r2, #0
 8002600:	635a      	str	r2, [r3, #52]	; 0x34
 8002602:	687b      	ldr	r3, [r7, #4]
 8002604:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8002606:	2b01      	cmp	r3, #1
 8002608:	d135      	bne.n	8002676 <UART_Receive_IT+0x164>
 800260a:	687b      	ldr	r3, [r7, #4]
 800260c:	2200      	movs	r2, #0
 800260e:	631a      	str	r2, [r3, #48]	; 0x30
 8002610:	687b      	ldr	r3, [r7, #4]
 8002612:	681b      	ldr	r3, [r3, #0]
 8002614:	330c      	adds	r3, #12
 8002616:	617b      	str	r3, [r7, #20]
 8002618:	697b      	ldr	r3, [r7, #20]
 800261a:	e853 3f00 	ldrex	r3, [r3]
 800261e:	613b      	str	r3, [r7, #16]
 8002620:	693b      	ldr	r3, [r7, #16]
 8002622:	f023 0310 	bic.w	r3, r3, #16
 8002626:	627b      	str	r3, [r7, #36]	; 0x24
 8002628:	687b      	ldr	r3, [r7, #4]
 800262a:	681b      	ldr	r3, [r3, #0]
 800262c:	330c      	adds	r3, #12
 800262e:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 8002630:	623a      	str	r2, [r7, #32]
 8002632:	61fb      	str	r3, [r7, #28]
 8002634:	69f9      	ldr	r1, [r7, #28]
 8002636:	6a3a      	ldr	r2, [r7, #32]
 8002638:	e841 2300 	strex	r3, r2, [r1]
 800263c:	61bb      	str	r3, [r7, #24]
 800263e:	69bb      	ldr	r3, [r7, #24]
 8002640:	2b00      	cmp	r3, #0
 8002642:	d1e5      	bne.n	8002610 <UART_Receive_IT+0xfe>
 8002644:	687b      	ldr	r3, [r7, #4]
 8002646:	681b      	ldr	r3, [r3, #0]
 8002648:	681b      	ldr	r3, [r3, #0]
 800264a:	f003 0310 	and.w	r3, r3, #16
 800264e:	2b10      	cmp	r3, #16
 8002650:	d10a      	bne.n	8002668 <UART_Receive_IT+0x156>
 8002652:	2300      	movs	r3, #0
 8002654:	60fb      	str	r3, [r7, #12]
 8002656:	687b      	ldr	r3, [r7, #4]
 8002658:	681b      	ldr	r3, [r3, #0]
 800265a:	681b      	ldr	r3, [r3, #0]
 800265c:	60fb      	str	r3, [r7, #12]
 800265e:	687b      	ldr	r3, [r7, #4]
 8002660:	681b      	ldr	r3, [r3, #0]
 8002662:	685b      	ldr	r3, [r3, #4]
 8002664:	60fb      	str	r3, [r7, #12]
 8002666:	68fb      	ldr	r3, [r7, #12]
 8002668:	687b      	ldr	r3, [r7, #4]
 800266a:	8d9b      	ldrh	r3, [r3, #44]	; 0x2c
 800266c:	4619      	mov	r1, r3
 800266e:	6878      	ldr	r0, [r7, #4]
 8002670:	f7ff fe2e 	bl	80022d0 <HAL_UARTEx_RxEventCallback>
 8002674:	e002      	b.n	800267c <UART_Receive_IT+0x16a>
 8002676:	6878      	ldr	r0, [r7, #4]
 8002678:	f000 fcc6 	bl	8003008 <HAL_UART_RxCpltCallback>
 800267c:	2300      	movs	r3, #0
 800267e:	e002      	b.n	8002686 <UART_Receive_IT+0x174>
 8002680:	2300      	movs	r3, #0
 8002682:	e000      	b.n	8002686 <UART_Receive_IT+0x174>
 8002684:	2302      	movs	r3, #2
 8002686:	4618      	mov	r0, r3
 8002688:	3730      	adds	r7, #48	; 0x30
 800268a:	46bd      	mov	sp, r7
 800268c:	bd80      	pop	{r7, pc}
	...

08002690 <UART_SetConfig>:
 8002690:	b580      	push	{r7, lr}
 8002692:	b084      	sub	sp, #16
 8002694:	af00      	add	r7, sp, #0
 8002696:	6078      	str	r0, [r7, #4]
 8002698:	687b      	ldr	r3, [r7, #4]
 800269a:	681b      	ldr	r3, [r3, #0]
 800269c:	691b      	ldr	r3, [r3, #16]
 800269e:	f423 5140 	bic.w	r1, r3, #12288	; 0x3000
 80026a2:	687b      	ldr	r3, [r7, #4]
 80026a4:	68da      	ldr	r2, [r3, #12]
 80026a6:	687b      	ldr	r3, [r7, #4]
 80026a8:	681b      	ldr	r3, [r3, #0]
 80026aa:	430a      	orrs	r2, r1
 80026ac:	611a      	str	r2, [r3, #16]
 80026ae:	687b      	ldr	r3, [r7, #4]
 80026b0:	689a      	ldr	r2, [r3, #8]
 80026b2:	687b      	ldr	r3, [r7, #4]
 80026b4:	691b      	ldr	r3, [r3, #16]
 80026b6:	431a      	orrs	r2, r3
 80026b8:	687b      	ldr	r3, [r7, #4]
 80026ba:	695b      	ldr	r3, [r3, #20]
 80026bc:	4313      	orrs	r3, r2
 80026be:	60bb      	str	r3, [r7, #8]
 80026c0:	687b      	ldr	r3, [r7, #4]
 80026c2:	681b      	ldr	r3, [r3, #0]
 80026c4:	68db      	ldr	r3, [r3, #12]
 80026c6:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 80026ca:	f023 030c 	bic.w	r3, r3, #12
 80026ce:	687a      	ldr	r2, [r7, #4]
 80026d0:	6812      	ldr	r2, [r2, #0]
 80026d2:	68b9      	ldr	r1, [r7, #8]
 80026d4:	430b      	orrs	r3, r1
 80026d6:	60d3      	str	r3, [r2, #12]
 80026d8:	687b      	ldr	r3, [r7, #4]
 80026da:	681b      	ldr	r3, [r3, #0]
 80026dc:	695b      	ldr	r3, [r3, #20]
 80026de:	f423 7140 	bic.w	r1, r3, #768	; 0x300
 80026e2:	687b      	ldr	r3, [r7, #4]
 80026e4:	699a      	ldr	r2, [r3, #24]
 80026e6:	687b      	ldr	r3, [r7, #4]
 80026e8:	681b      	ldr	r3, [r3, #0]
 80026ea:	430a      	orrs	r2, r1
 80026ec:	615a      	str	r2, [r3, #20]
 80026ee:	687b      	ldr	r3, [r7, #4]
 80026f0:	681b      	ldr	r3, [r3, #0]
 80026f2:	4a2c      	ldr	r2, [pc, #176]	; (80027a4 <UART_SetConfig+0x114>)
 80026f4:	4293      	cmp	r3, r2
 80026f6:	d103      	bne.n	8002700 <UART_SetConfig+0x70>
 80026f8:	f7ff fa96 	bl	8001c28 <HAL_RCC_GetPCLK2Freq>
 80026fc:	60f8      	str	r0, [r7, #12]
 80026fe:	e002      	b.n	8002706 <UART_SetConfig+0x76>
 8002700:	f7ff fa7e 	bl	8001c00 <HAL_RCC_GetPCLK1Freq>
 8002704:	60f8      	str	r0, [r7, #12]
 8002706:	68fa      	ldr	r2, [r7, #12]
 8002708:	4613      	mov	r3, r2
 800270a:	009b      	lsls	r3, r3, #2
 800270c:	4413      	add	r3, r2
 800270e:	009a      	lsls	r2, r3, #2
 8002710:	441a      	add	r2, r3
 8002712:	687b      	ldr	r3, [r7, #4]
 8002714:	685b      	ldr	r3, [r3, #4]
 8002716:	009b      	lsls	r3, r3, #2
 8002718:	fbb2 f3f3 	udiv	r3, r2, r3
 800271c:	4a22      	ldr	r2, [pc, #136]	; (80027a8 <UART_SetConfig+0x118>)
 800271e:	fba2 2303 	umull	r2, r3, r2, r3
 8002722:	095b      	lsrs	r3, r3, #5
 8002724:	0119      	lsls	r1, r3, #4
 8002726:	68fa      	ldr	r2, [r7, #12]
 8002728:	4613      	mov	r3, r2
 800272a:	009b      	lsls	r3, r3, #2
 800272c:	4413      	add	r3, r2
 800272e:	009a      	lsls	r2, r3, #2
 8002730:	441a      	add	r2, r3
 8002732:	687b      	ldr	r3, [r7, #4]
 8002734:	685b      	ldr	r3, [r3, #4]
 8002736:	009b      	lsls	r3, r3, #2
 8002738:	fbb2 f2f3 	udiv	r2, r2, r3
 800273c:	4b1a      	ldr	r3, [pc, #104]	; (80027a8 <UART_SetConfig+0x118>)
 800273e:	fba3 0302 	umull	r0, r3, r3, r2
 8002742:	095b      	lsrs	r3, r3, #5
 8002744:	2064      	movs	r0, #100	; 0x64
 8002746:	fb00 f303 	mul.w	r3, r0, r3
 800274a:	1ad3      	subs	r3, r2, r3
 800274c:	011b      	lsls	r3, r3, #4
 800274e:	3332      	adds	r3, #50	; 0x32
 8002750:	4a15      	ldr	r2, [pc, #84]	; (80027a8 <UART_SetConfig+0x118>)
 8002752:	fba2 2303 	umull	r2, r3, r2, r3
 8002756:	095b      	lsrs	r3, r3, #5
 8002758:	f003 03f0 	and.w	r3, r3, #240	; 0xf0
 800275c:	4419      	add	r1, r3
 800275e:	68fa      	ldr	r2, [r7, #12]
 8002760:	4613      	mov	r3, r2
 8002762:	009b      	lsls	r3, r3, #2
 8002764:	4413      	add	r3, r2
 8002766:	009a      	lsls	r2, r3, #2
 8002768:	441a      	add	r2, r3
 800276a:	687b      	ldr	r3, [r7, #4]
 800276c:	685b      	ldr	r3, [r3, #4]
 800276e:	009b      	lsls	r3, r3, #2
 8002770:	fbb2 f2f3 	udiv	r2, r2, r3
 8002774:	4b0c      	ldr	r3, [pc, #48]	; (80027a8 <UART_SetConfig+0x118>)
 8002776:	fba3 0302 	umull	r0, r3, r3, r2
 800277a:	095b      	lsrs	r3, r3, #5
 800277c:	2064      	movs	r0, #100	; 0x64
 800277e:	fb00 f303 	mul.w	r3, r0, r3
 8002782:	1ad3      	subs	r3, r2, r3
 8002784:	011b      	lsls	r3, r3, #4
 8002786:	3332      	adds	r3, #50	; 0x32
 8002788:	4a07      	ldr	r2, [pc, #28]	; (80027a8 <UART_SetConfig+0x118>)
 800278a:	fba2 2303 	umull	r2, r3, r2, r3
 800278e:	095b      	lsrs	r3, r3, #5
 8002790:	f003 020f 	and.w	r2, r3, #15
 8002794:	687b      	ldr	r3, [r7, #4]
 8002796:	681b      	ldr	r3, [r3, #0]
 8002798:	440a      	add	r2, r1
 800279a:	609a      	str	r2, [r3, #8]
 800279c:	bf00      	nop
 800279e:	3710      	adds	r7, #16
 80027a0:	46bd      	mov	sp, r7
 80027a2:	bd80      	pop	{r7, pc}
 80027a4:	40013800 	.word	0x40013800
 80027a8:	51eb851f 	.word	0x51eb851f

080027ac <flash_sector_size>:
 80027ac:	b480      	push	{r7}
 80027ae:	b083      	sub	sp, #12
 80027b0:	af00      	add	r7, sp, #0
 80027b2:	6078      	str	r0, [r7, #4]
 80027b4:	f44f 6300 	mov.w	r3, #2048	; 0x800
 80027b8:	4618      	mov	r0, r3
 80027ba:	370c      	adds	r7, #12
 80027bc:	46bd      	mov	sp, r7
 80027be:	bc80      	pop	{r7}
 80027c0:	4770      	bx	lr

080027c2 <is_blank>:
 80027c2:	b480      	push	{r7}
 80027c4:	b085      	sub	sp, #20
 80027c6:	af00      	add	r7, sp, #0
 80027c8:	6078      	str	r0, [r7, #4]
 80027ca:	6039      	str	r1, [r7, #0]
 80027cc:	2300      	movs	r3, #0
 80027ce:	60fb      	str	r3, [r7, #12]
 80027d0:	e00b      	b.n	80027ea <is_blank+0x28>
 80027d2:	687a      	ldr	r2, [r7, #4]
 80027d4:	68fb      	ldr	r3, [r7, #12]
 80027d6:	4413      	add	r3, r2
 80027d8:	681b      	ldr	r3, [r3, #0]
 80027da:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80027de:	d001      	beq.n	80027e4 <is_blank+0x22>
 80027e0:	2300      	movs	r3, #0
 80027e2:	e007      	b.n	80027f4 <is_blank+0x32>
 80027e4:	68fb      	ldr	r3, [r7, #12]
 80027e6:	3304      	adds	r3, #4
 80027e8:	60fb      	str	r3, [r7, #12]
 80027ea:	68fa      	ldr	r2, [r7, #12]
 80027ec:	683b      	ldr	r3, [r7, #0]
 80027ee:	429a      	cmp	r2, r3
 80027f0:	d3ef      	bcc.n	80027d2 <is_blank+0x10>
 80027f2:	2301      	movs	r3, #1
 80027f4:	4618      	mov	r0, r3
 80027f6:	3714      	adds	r7, #20
 80027f8:	46bd      	mov	sp, r7
 80027fa:	bc80      	pop	{r7}
 80027fc:	4770      	bx	lr
	...

08002800 <flash_erase_sector>:
 8002800:	b580      	push	{r7, lr}
 8002802:	b08c      	sub	sp, #48	; 0x30
 8002804:	af00      	add	r7, sp, #0
 8002806:	6078      	str	r0, [r7, #4]
 8002808:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
 800280c:	62fb      	str	r3, [r7, #44]	; 0x2c
 800280e:	2300      	movs	r3, #0
 8002810:	f887 302b 	strb.w	r3, [r7, #43]	; 0x2b
 8002814:	2300      	movs	r3, #0
 8002816:	627b      	str	r3, [r7, #36]	; 0x24
 8002818:	2300      	movs	r3, #0
 800281a:	623b      	str	r3, [r7, #32]
 800281c:	e020      	b.n	8002860 <flash_erase_sector+0x60>
 800281e:	6a38      	ldr	r0, [r7, #32]
 8002820:	f7ff ffc4 	bl	80027ac <flash_sector_size>
 8002824:	6278      	str	r0, [r7, #36]	; 0x24
 8002826:	6afa      	ldr	r2, [r7, #44]	; 0x2c
 8002828:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800282a:	4413      	add	r3, r2
 800282c:	687a      	ldr	r2, [r7, #4]
 800282e:	429a      	cmp	r2, r3
 8002830:	d20f      	bcs.n	8002852 <flash_erase_sector+0x52>
 8002832:	4a27      	ldr	r2, [pc, #156]	; (80028d0 <flash_erase_sector+0xd0>)
 8002834:	6a3b      	ldr	r3, [r7, #32]
 8002836:	4413      	add	r3, r2
 8002838:	781b      	ldrb	r3, [r3, #0]
 800283a:	2b00      	cmp	r3, #0
 800283c:	bf14      	ite	ne
 800283e:	2301      	movne	r3, #1
 8002840:	2300      	moveq	r3, #0
 8002842:	f887 302b 	strb.w	r3, [r7, #43]	; 0x2b
 8002846:	4a22      	ldr	r2, [pc, #136]	; (80028d0 <flash_erase_sector+0xd0>)
 8002848:	6a3b      	ldr	r3, [r7, #32]
 800284a:	4413      	add	r3, r2
 800284c:	2201      	movs	r2, #1
 800284e:	701a      	strb	r2, [r3, #0]
 8002850:	e009      	b.n	8002866 <flash_erase_sector+0x66>
 8002852:	6afa      	ldr	r2, [r7, #44]	; 0x2c
 8002854:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8002856:	4413      	add	r3, r2
 8002858:	62fb      	str	r3, [r7, #44]	; 0x2c
 800285a:	6a3b      	ldr	r3, [r7, #32]
 800285c:	3301      	adds	r3, #1
 800285e:	623b      	str	r3, [r7, #32]
 8002860:	6a3b      	ldr	r3, [r7, #32]
 8002862:	2bff      	cmp	r3, #255	; 0xff
 8002864:	d9db      	bls.n	800281e <flash_erase_sector+0x1e>
 8002866:	f897 302b 	ldrb.w	r3, [r7, #43]	; 0x2b
 800286a:	f083 0301 	eor.w	r3, r3, #1
 800286e:	b2db      	uxtb	r3, r3
 8002870:	2b00      	cmp	r3, #0
 8002872:	d027      	beq.n	80028c4 <flash_erase_sector+0xc4>
 8002874:	6a79      	ldr	r1, [r7, #36]	; 0x24
 8002876:	6af8      	ldr	r0, [r7, #44]	; 0x2c
 8002878:	f7ff ffa3 	bl	80027c2 <is_blank>
 800287c:	4603      	mov	r3, r0
 800287e:	f083 0301 	eor.w	r3, r3, #1
 8002882:	b2db      	uxtb	r3, r3
 8002884:	2b00      	cmp	r3, #0
 8002886:	d01d      	beq.n	80028c4 <flash_erase_sector+0xc4>
 8002888:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800288a:	0a9b      	lsrs	r3, r3, #10
 800288c:	461a      	mov	r2, r3
 800288e:	6af9      	ldr	r1, [r7, #44]	; 0x2c
 8002890:	4810      	ldr	r0, [pc, #64]	; (80028d4 <flash_erase_sector+0xd4>)
 8002892:	f000 fc71 	bl	8003178 <iprintf>
 8002896:	2300      	movs	r3, #0
 8002898:	613b      	str	r3, [r7, #16]
 800289a:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800289c:	61bb      	str	r3, [r7, #24]
 800289e:	2301      	movs	r3, #1
 80028a0:	61fb      	str	r3, [r7, #28]
 80028a2:	2300      	movs	r3, #0
 80028a4:	60fb      	str	r3, [r7, #12]
 80028a6:	f107 020c 	add.w	r2, r7, #12
 80028aa:	f107 0310 	add.w	r3, r7, #16
 80028ae:	4611      	mov	r1, r2
 80028b0:	4618      	mov	r0, r3
 80028b2:	f7fe fa09 	bl	8000cc8 <HAL_FLASHEx_Erase>
 80028b6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80028ba:	f7fe f96f 	bl	8000b9c <FLASH_WaitForLastOperation>
 80028be:	4806      	ldr	r0, [pc, #24]	; (80028d8 <flash_erase_sector+0xd8>)
 80028c0:	f000 fce0 	bl	8003284 <puts>
 80028c4:	2301      	movs	r3, #1
 80028c6:	4618      	mov	r0, r3
 80028c8:	3730      	adds	r7, #48	; 0x30
 80028ca:	46bd      	mov	sp, r7
 80028cc:	bd80      	pop	{r7, pc}
 80028ce:	bf00      	nop
 80028d0:	200000c0 	.word	0x200000c0
 80028d4:	08004650 	.word	0x08004650
 80028d8:	08004670 	.word	0x08004670

080028dc <flash_write>:
 80028dc:	b5b0      	push	{r4, r5, r7, lr}
 80028de:	b088      	sub	sp, #32
 80028e0:	af00      	add	r7, sp, #0
 80028e2:	60f8      	str	r0, [r7, #12]
 80028e4:	60b9      	str	r1, [r7, #8]
 80028e6:	607a      	str	r2, [r7, #4]
 80028e8:	2300      	movs	r3, #0
 80028ea:	61fb      	str	r3, [r7, #28]
 80028ec:	68f8      	ldr	r0, [r7, #12]
 80028ee:	f7ff ff87 	bl	8002800 <flash_erase_sector>
 80028f2:	68f9      	ldr	r1, [r7, #12]
 80028f4:	4825      	ldr	r0, [pc, #148]	; (800298c <flash_write+0xb0>)
 80028f6:	f000 fc3f 	bl	8003178 <iprintf>
 80028fa:	2300      	movs	r3, #0
 80028fc:	61bb      	str	r3, [r7, #24]
 80028fe:	e02d      	b.n	800295c <flash_write+0x80>
 8002900:	69bb      	ldr	r3, [r7, #24]
 8002902:	68ba      	ldr	r2, [r7, #8]
 8002904:	4413      	add	r3, r2
 8002906:	681b      	ldr	r3, [r3, #0]
 8002908:	617b      	str	r3, [r7, #20]
 800290a:	69ba      	ldr	r2, [r7, #24]
 800290c:	68fb      	ldr	r3, [r7, #12]
 800290e:	18d1      	adds	r1, r2, r3
 8002910:	697b      	ldr	r3, [r7, #20]
 8002912:	2200      	movs	r2, #0
 8002914:	461c      	mov	r4, r3
 8002916:	4615      	mov	r5, r2
 8002918:	4622      	mov	r2, r4
 800291a:	462b      	mov	r3, r5
 800291c:	2002      	movs	r0, #2
 800291e:	f7fe f87b 	bl	8000a18 <HAL_FLASH_Program>
 8002922:	4603      	mov	r3, r0
 8002924:	2b00      	cmp	r3, #0
 8002926:	d009      	beq.n	800293c <flash_write+0x60>
 8002928:	69ba      	ldr	r2, [r7, #24]
 800292a:	68fb      	ldr	r3, [r7, #12]
 800292c:	4413      	add	r3, r2
 800292e:	4619      	mov	r1, r3
 8002930:	4817      	ldr	r0, [pc, #92]	; (8002990 <flash_write+0xb4>)
 8002932:	f000 fc21 	bl	8003178 <iprintf>
 8002936:	2301      	movs	r3, #1
 8002938:	61fb      	str	r3, [r7, #28]
 800293a:	e013      	b.n	8002964 <flash_write+0x88>
 800293c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8002940:	f7fe f92c 	bl	8000b9c <FLASH_WaitForLastOperation>
 8002944:	4603      	mov	r3, r0
 8002946:	2b00      	cmp	r3, #0
 8002948:	d005      	beq.n	8002956 <flash_write+0x7a>
 800294a:	4812      	ldr	r0, [pc, #72]	; (8002994 <flash_write+0xb8>)
 800294c:	f000 fc9a 	bl	8003284 <puts>
 8002950:	2302      	movs	r3, #2
 8002952:	61fb      	str	r3, [r7, #28]
 8002954:	e006      	b.n	8002964 <flash_write+0x88>
 8002956:	69bb      	ldr	r3, [r7, #24]
 8002958:	3304      	adds	r3, #4
 800295a:	61bb      	str	r3, [r7, #24]
 800295c:	69ba      	ldr	r2, [r7, #24]
 800295e:	687b      	ldr	r3, [r7, #4]
 8002960:	429a      	cmp	r2, r3
 8002962:	dbcd      	blt.n	8002900 <flash_write+0x24>
 8002964:	68fb      	ldr	r3, [r7, #12]
 8002966:	687a      	ldr	r2, [r7, #4]
 8002968:	68b9      	ldr	r1, [r7, #8]
 800296a:	4618      	mov	r0, r3
 800296c:	f000 fbe6 	bl	800313c <memcmp>
 8002970:	4603      	mov	r3, r0
 8002972:	2b00      	cmp	r3, #0
 8002974:	d004      	beq.n	8002980 <flash_write+0xa4>
 8002976:	4808      	ldr	r0, [pc, #32]	; (8002998 <flash_write+0xbc>)
 8002978:	f000 fc84 	bl	8003284 <puts>
 800297c:	2303      	movs	r3, #3
 800297e:	61fb      	str	r3, [r7, #28]
 8002980:	69fb      	ldr	r3, [r7, #28]
 8002982:	4618      	mov	r0, r3
 8002984:	3720      	adds	r7, #32
 8002986:	46bd      	mov	sp, r7
 8002988:	bdb0      	pop	{r4, r5, r7, pc}
 800298a:	bf00      	nop
 800298c:	08004674 	.word	0x08004674
 8002990:	08004694 	.word	0x08004694
 8002994:	080046c0 	.word	0x080046c0
 8002998:	080046e4 	.word	0x080046e4

0800299c <board_flash_read>:
 800299c:	b580      	push	{r7, lr}
 800299e:	b084      	sub	sp, #16
 80029a0:	af00      	add	r7, sp, #0
 80029a2:	60f8      	str	r0, [r7, #12]
 80029a4:	60b9      	str	r1, [r7, #8]
 80029a6:	607a      	str	r2, [r7, #4]
 80029a8:	68fb      	ldr	r3, [r7, #12]
 80029aa:	687a      	ldr	r2, [r7, #4]
 80029ac:	4619      	mov	r1, r3
 80029ae:	68b8      	ldr	r0, [r7, #8]
 80029b0:	f000 fbd4 	bl	800315c <memcpy>
 80029b4:	bf00      	nop
 80029b6:	3710      	adds	r7, #16
 80029b8:	46bd      	mov	sp, r7
 80029ba:	bd80      	pop	{r7, pc}

080029bc <board_flash_flush>:
 80029bc:	b580      	push	{r7, lr}
 80029be:	b094      	sub	sp, #80	; 0x50
 80029c0:	af00      	add	r7, sp, #0
 80029c2:	6078      	str	r0, [r7, #4]
 80029c4:	2300      	movs	r3, #0
 80029c6:	637b      	str	r3, [r7, #52]	; 0x34
 80029c8:	2300      	movs	r3, #0
 80029ca:	64fb      	str	r3, [r7, #76]	; 0x4c
 80029cc:	2300      	movs	r3, #0
 80029ce:	60fb      	str	r3, [r7, #12]
 80029d0:	f107 0310 	add.w	r3, r7, #16
 80029d4:	2224      	movs	r2, #36	; 0x24
 80029d6:	2100      	movs	r1, #0
 80029d8:	4618      	mov	r0, r3
 80029da:	f7fd fc47 	bl	800026c <memset>
 80029de:	4a50      	ldr	r2, [pc, #320]	; (8002b20 <board_flash_flush+0x164>)
 80029e0:	687b      	ldr	r3, [r7, #4]
 80029e2:	6013      	str	r3, [r2, #0]
 80029e4:	f7fe f888 	bl	8000af8 <HAL_FLASH_Unlock>
 80029e8:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 80029ec:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 80029f0:	e9c7 230e 	strd	r2, r3, [r7, #56]	; 0x38
 80029f4:	f107 0234 	add.w	r2, r7, #52	; 0x34
 80029f8:	f107 0338 	add.w	r3, r7, #56	; 0x38
 80029fc:	2108      	movs	r1, #8
 80029fe:	4618      	mov	r0, r3
 8002a00:	f000 fb5e 	bl	80030c0 <usart_read>
 8002a04:	64b8      	str	r0, [r7, #72]	; 0x48
 8002a06:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8002a08:	2b00      	cmp	r3, #0
 8002a0a:	d032      	beq.n	8002a72 <board_flash_flush+0xb6>
 8002a0c:	4b44      	ldr	r3, [pc, #272]	; (8002b20 <board_flash_flush+0x164>)
 8002a0e:	681b      	ldr	r3, [r3, #0]
 8002a10:	4a44      	ldr	r2, [pc, #272]	; (8002b24 <board_flash_flush+0x168>)
 8002a12:	4293      	cmp	r3, r2
 8002a14:	d804      	bhi.n	8002a20 <board_flash_flush+0x64>
 8002a16:	4b42      	ldr	r3, [pc, #264]	; (8002b20 <board_flash_flush+0x164>)
 8002a18:	681b      	ldr	r3, [r3, #0]
 8002a1a:	687a      	ldr	r2, [r7, #4]
 8002a1c:	429a      	cmp	r2, r3
 8002a1e:	d903      	bls.n	8002a28 <board_flash_flush+0x6c>
 8002a20:	f7fe f890 	bl	8000b44 <HAL_FLASH_Lock>
 8002a24:	2304      	movs	r3, #4
 8002a26:	e076      	b.n	8002b16 <board_flash_flush+0x15a>
 8002a28:	4b3d      	ldr	r3, [pc, #244]	; (8002b20 <board_flash_flush+0x164>)
 8002a2a:	681b      	ldr	r3, [r3, #0]
 8002a2c:	6b7a      	ldr	r2, [r7, #52]	; 0x34
 8002a2e:	f107 0138 	add.w	r1, r7, #56	; 0x38
 8002a32:	4618      	mov	r0, r3
 8002a34:	f7ff ff52 	bl	80028dc <flash_write>
 8002a38:	6478      	str	r0, [r7, #68]	; 0x44
 8002a3a:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8002a3c:	2b00      	cmp	r3, #0
 8002a3e:	d109      	bne.n	8002a54 <board_flash_flush+0x98>
 8002a40:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8002a42:	3301      	adds	r3, #1
 8002a44:	64fb      	str	r3, [r7, #76]	; 0x4c
 8002a46:	4b36      	ldr	r3, [pc, #216]	; (8002b20 <board_flash_flush+0x164>)
 8002a48:	681a      	ldr	r2, [r3, #0]
 8002a4a:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8002a4c:	4413      	add	r3, r2
 8002a4e:	4a34      	ldr	r2, [pc, #208]	; (8002b20 <board_flash_flush+0x164>)
 8002a50:	6013      	str	r3, [r2, #0]
 8002a52:	e00e      	b.n	8002a72 <board_flash_flush+0xb6>
 8002a54:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8002a56:	00da      	lsls	r2, r3, #3
 8002a58:	f107 030c 	add.w	r3, r7, #12
 8002a5c:	4932      	ldr	r1, [pc, #200]	; (8002b28 <board_flash_flush+0x16c>)
 8002a5e:	4618      	mov	r0, r3
 8002a60:	f000 fc18 	bl	8003294 <siprintf>
 8002a64:	f107 030c 	add.w	r3, r7, #12
 8002a68:	4618      	mov	r0, r3
 8002a6a:	f000 fb85 	bl	8003178 <iprintf>
 8002a6e:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8002a70:	e051      	b.n	8002b16 <board_flash_flush+0x15a>
 8002a72:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8002a74:	2b00      	cmp	r3, #0
 8002a76:	d102      	bne.n	8002a7e <board_flash_flush+0xc2>
 8002a78:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8002a7a:	2b00      	cmp	r3, #0
 8002a7c:	d1b4      	bne.n	80029e8 <board_flash_flush+0x2c>
 8002a7e:	f7fe f861 	bl	8000b44 <HAL_FLASH_Lock>
 8002a82:	482a      	ldr	r0, [pc, #168]	; (8002b2c <board_flash_flush+0x170>)
 8002a84:	f000 fbfe 	bl	8003284 <puts>
 8002a88:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8002a8a:	00da      	lsls	r2, r3, #3
 8002a8c:	f107 030c 	add.w	r3, r7, #12
 8002a90:	4927      	ldr	r1, [pc, #156]	; (8002b30 <board_flash_flush+0x174>)
 8002a92:	4618      	mov	r0, r3
 8002a94:	f000 fbfe 	bl	8003294 <siprintf>
 8002a98:	f107 030c 	add.w	r3, r7, #12
 8002a9c:	4618      	mov	r0, r3
 8002a9e:	f000 fb6b 	bl	8003178 <iprintf>
 8002aa2:	4a1f      	ldr	r2, [pc, #124]	; (8002b20 <board_flash_flush+0x164>)
 8002aa4:	687b      	ldr	r3, [r7, #4]
 8002aa6:	6013      	str	r3, [r2, #0]
 8002aa8:	2300      	movs	r3, #0
 8002aaa:	64fb      	str	r3, [r7, #76]	; 0x4c
 8002aac:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8002ab0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8002ab4:	e9c7 230e 	strd	r2, r3, [r7, #56]	; 0x38
 8002ab8:	f107 0234 	add.w	r2, r7, #52	; 0x34
 8002abc:	f107 0338 	add.w	r3, r7, #56	; 0x38
 8002ac0:	2104      	movs	r1, #4
 8002ac2:	4618      	mov	r0, r3
 8002ac4:	f000 fafc 	bl	80030c0 <usart_read>
 8002ac8:	64b8      	str	r0, [r7, #72]	; 0x48
 8002aca:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8002acc:	2b00      	cmp	r3, #0
 8002ace:	d018      	beq.n	8002b02 <board_flash_flush+0x146>
 8002ad0:	4b13      	ldr	r3, [pc, #76]	; (8002b20 <board_flash_flush+0x164>)
 8002ad2:	681b      	ldr	r3, [r3, #0]
 8002ad4:	6819      	ldr	r1, [r3, #0]
 8002ad6:	e9d7 230e 	ldrd	r2, r3, [r7, #56]	; 0x38
 8002ada:	4613      	mov	r3, r2
 8002adc:	4299      	cmp	r1, r3
 8002ade:	d108      	bne.n	8002af2 <board_flash_flush+0x136>
 8002ae0:	4b0f      	ldr	r3, [pc, #60]	; (8002b20 <board_flash_flush+0x164>)
 8002ae2:	681b      	ldr	r3, [r3, #0]
 8002ae4:	3304      	adds	r3, #4
 8002ae6:	4a0e      	ldr	r2, [pc, #56]	; (8002b20 <board_flash_flush+0x164>)
 8002ae8:	6013      	str	r3, [r2, #0]
 8002aea:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8002aec:	3301      	adds	r3, #1
 8002aee:	64fb      	str	r3, [r7, #76]	; 0x4c
 8002af0:	e007      	b.n	8002b02 <board_flash_flush+0x146>
 8002af2:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8002af4:	009b      	lsls	r3, r3, #2
 8002af6:	4619      	mov	r1, r3
 8002af8:	480e      	ldr	r0, [pc, #56]	; (8002b34 <board_flash_flush+0x178>)
 8002afa:	f000 fb3d 	bl	8003178 <iprintf>
 8002afe:	2305      	movs	r3, #5
 8002b00:	e009      	b.n	8002b16 <board_flash_flush+0x15a>
 8002b02:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8002b04:	2b00      	cmp	r3, #0
 8002b06:	d102      	bne.n	8002b0e <board_flash_flush+0x152>
 8002b08:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8002b0a:	2b00      	cmp	r3, #0
 8002b0c:	d1ce      	bne.n	8002aac <board_flash_flush+0xf0>
 8002b0e:	480a      	ldr	r0, [pc, #40]	; (8002b38 <board_flash_flush+0x17c>)
 8002b10:	f000 fbb8 	bl	8003284 <puts>
 8002b14:	2300      	movs	r3, #0
 8002b16:	4618      	mov	r0, r3
 8002b18:	3750      	adds	r7, #80	; 0x50
 8002b1a:	46bd      	mov	sp, r7
 8002b1c:	bd80      	pop	{r7, pc}
 8002b1e:	bf00      	nop
 8002b20:	20000070 	.word	0x20000070
 8002b24:	0807fff8 	.word	0x0807fff8
 8002b28:	080046f8 	.word	0x080046f8
 8002b2c:	08004718 	.word	0x08004718
 8002b30:	08004730 	.word	0x08004730
 8002b34:	08004748 	.word	0x08004748
 8002b38:	0800476c 	.word	0x0800476c

08002b3c <board_flash_write>:
 8002b3c:	b580      	push	{r7, lr}
 8002b3e:	b084      	sub	sp, #16
 8002b40:	af00      	add	r7, sp, #0
 8002b42:	60f8      	str	r0, [r7, #12]
 8002b44:	60b9      	str	r1, [r7, #8]
 8002b46:	607a      	str	r2, [r7, #4]
 8002b48:	f7fd ffd6 	bl	8000af8 <HAL_FLASH_Unlock>
 8002b4c:	687b      	ldr	r3, [r7, #4]
 8002b4e:	461a      	mov	r2, r3
 8002b50:	68b9      	ldr	r1, [r7, #8]
 8002b52:	68f8      	ldr	r0, [r7, #12]
 8002b54:	f7ff fec2 	bl	80028dc <flash_write>
 8002b58:	f7fd fff4 	bl	8000b44 <HAL_FLASH_Lock>
 8002b5c:	bf00      	nop
 8002b5e:	3710      	adds	r7, #16
 8002b60:	46bd      	mov	sp, r7
 8002b62:	bd80      	pop	{r7, pc}

08002b64 <clock_init>:
 8002b64:	b580      	push	{r7, lr}
 8002b66:	b090      	sub	sp, #64	; 0x40
 8002b68:	af00      	add	r7, sp, #0
 8002b6a:	f107 0318 	add.w	r3, r7, #24
 8002b6e:	2228      	movs	r2, #40	; 0x28
 8002b70:	2100      	movs	r1, #0
 8002b72:	4618      	mov	r0, r3
 8002b74:	f7fd fb7a 	bl	800026c <memset>
 8002b78:	1d3b      	adds	r3, r7, #4
 8002b7a:	2200      	movs	r2, #0
 8002b7c:	601a      	str	r2, [r3, #0]
 8002b7e:	605a      	str	r2, [r3, #4]
 8002b80:	609a      	str	r2, [r3, #8]
 8002b82:	60da      	str	r2, [r3, #12]
 8002b84:	611a      	str	r2, [r3, #16]
 8002b86:	2309      	movs	r3, #9
 8002b88:	61bb      	str	r3, [r7, #24]
 8002b8a:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 8002b8e:	61fb      	str	r3, [r7, #28]
 8002b90:	2300      	movs	r3, #0
 8002b92:	623b      	str	r3, [r7, #32]
 8002b94:	2301      	movs	r3, #1
 8002b96:	62bb      	str	r3, [r7, #40]	; 0x28
 8002b98:	2301      	movs	r3, #1
 8002b9a:	633b      	str	r3, [r7, #48]	; 0x30
 8002b9c:	2302      	movs	r3, #2
 8002b9e:	637b      	str	r3, [r7, #52]	; 0x34
 8002ba0:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 8002ba4:	63bb      	str	r3, [r7, #56]	; 0x38
 8002ba6:	f44f 13e0 	mov.w	r3, #1835008	; 0x1c0000
 8002baa:	63fb      	str	r3, [r7, #60]	; 0x3c
 8002bac:	f107 0318 	add.w	r3, r7, #24
 8002bb0:	4618      	mov	r0, r3
 8002bb2:	f7fe fc5b 	bl	800146c <HAL_RCC_OscConfig>
 8002bb6:	230f      	movs	r3, #15
 8002bb8:	607b      	str	r3, [r7, #4]
 8002bba:	2302      	movs	r3, #2
 8002bbc:	60bb      	str	r3, [r7, #8]
 8002bbe:	2300      	movs	r3, #0
 8002bc0:	60fb      	str	r3, [r7, #12]
 8002bc2:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8002bc6:	613b      	str	r3, [r7, #16]
 8002bc8:	2300      	movs	r3, #0
 8002bca:	617b      	str	r3, [r7, #20]
 8002bcc:	1d3b      	adds	r3, r7, #4
 8002bce:	2102      	movs	r1, #2
 8002bd0:	4618      	mov	r0, r3
 8002bd2:	f7fe fecd 	bl	8001970 <HAL_RCC_ClockConfig>
 8002bd6:	4b08      	ldr	r3, [pc, #32]	; (8002bf8 <clock_init+0x94>)
 8002bd8:	69db      	ldr	r3, [r3, #28]
 8002bda:	4a07      	ldr	r2, [pc, #28]	; (8002bf8 <clock_init+0x94>)
 8002bdc:	f043 5380 	orr.w	r3, r3, #268435456	; 0x10000000
 8002be0:	61d3      	str	r3, [r2, #28]
 8002be2:	4b05      	ldr	r3, [pc, #20]	; (8002bf8 <clock_init+0x94>)
 8002be4:	69db      	ldr	r3, [r3, #28]
 8002be6:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 8002bea:	603b      	str	r3, [r7, #0]
 8002bec:	683b      	ldr	r3, [r7, #0]
 8002bee:	bf00      	nop
 8002bf0:	3740      	adds	r7, #64	; 0x40
 8002bf2:	46bd      	mov	sp, r7
 8002bf4:	bd80      	pop	{r7, pc}
 8002bf6:	bf00      	nop
 8002bf8:	40021000 	.word	0x40021000

08002bfc <board_gpio_init>:
 8002bfc:	b580      	push	{r7, lr}
 8002bfe:	b088      	sub	sp, #32
 8002c00:	af00      	add	r7, sp, #0
 8002c02:	4b45      	ldr	r3, [pc, #276]	; (8002d18 <board_gpio_init+0x11c>)
 8002c04:	699b      	ldr	r3, [r3, #24]
 8002c06:	4a44      	ldr	r2, [pc, #272]	; (8002d18 <board_gpio_init+0x11c>)
 8002c08:	f043 0304 	orr.w	r3, r3, #4
 8002c0c:	6193      	str	r3, [r2, #24]
 8002c0e:	4b42      	ldr	r3, [pc, #264]	; (8002d18 <board_gpio_init+0x11c>)
 8002c10:	699b      	ldr	r3, [r3, #24]
 8002c12:	f003 0304 	and.w	r3, r3, #4
 8002c16:	60fb      	str	r3, [r7, #12]
 8002c18:	68fb      	ldr	r3, [r7, #12]
 8002c1a:	4b3f      	ldr	r3, [pc, #252]	; (8002d18 <board_gpio_init+0x11c>)
 8002c1c:	699b      	ldr	r3, [r3, #24]
 8002c1e:	4a3e      	ldr	r2, [pc, #248]	; (8002d18 <board_gpio_init+0x11c>)
 8002c20:	f043 0308 	orr.w	r3, r3, #8
 8002c24:	6193      	str	r3, [r2, #24]
 8002c26:	4b3c      	ldr	r3, [pc, #240]	; (8002d18 <board_gpio_init+0x11c>)
 8002c28:	699b      	ldr	r3, [r3, #24]
 8002c2a:	f003 0308 	and.w	r3, r3, #8
 8002c2e:	60bb      	str	r3, [r7, #8]
 8002c30:	68bb      	ldr	r3, [r7, #8]
 8002c32:	4b39      	ldr	r3, [pc, #228]	; (8002d18 <board_gpio_init+0x11c>)
 8002c34:	699b      	ldr	r3, [r3, #24]
 8002c36:	4a38      	ldr	r2, [pc, #224]	; (8002d18 <board_gpio_init+0x11c>)
 8002c38:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8002c3c:	6193      	str	r3, [r2, #24]
 8002c3e:	4b36      	ldr	r3, [pc, #216]	; (8002d18 <board_gpio_init+0x11c>)
 8002c40:	699b      	ldr	r3, [r3, #24]
 8002c42:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8002c46:	607b      	str	r3, [r7, #4]
 8002c48:	687b      	ldr	r3, [r7, #4]
 8002c4a:	4b33      	ldr	r3, [pc, #204]	; (8002d18 <board_gpio_init+0x11c>)
 8002c4c:	699b      	ldr	r3, [r3, #24]
 8002c4e:	4a32      	ldr	r2, [pc, #200]	; (8002d18 <board_gpio_init+0x11c>)
 8002c50:	f043 0301 	orr.w	r3, r3, #1
 8002c54:	6193      	str	r3, [r2, #24]
 8002c56:	4b30      	ldr	r3, [pc, #192]	; (8002d18 <board_gpio_init+0x11c>)
 8002c58:	699b      	ldr	r3, [r3, #24]
 8002c5a:	f003 0301 	and.w	r3, r3, #1
 8002c5e:	603b      	str	r3, [r7, #0]
 8002c60:	683b      	ldr	r3, [r7, #0]
 8002c62:	f107 0310 	add.w	r3, r7, #16
 8002c66:	2200      	movs	r2, #0
 8002c68:	601a      	str	r2, [r3, #0]
 8002c6a:	605a      	str	r2, [r3, #4]
 8002c6c:	609a      	str	r2, [r3, #8]
 8002c6e:	60da      	str	r2, [r3, #12]
 8002c70:	2320      	movs	r3, #32
 8002c72:	613b      	str	r3, [r7, #16]
 8002c74:	2301      	movs	r3, #1
 8002c76:	617b      	str	r3, [r7, #20]
 8002c78:	2301      	movs	r3, #1
 8002c7a:	61bb      	str	r3, [r7, #24]
 8002c7c:	2303      	movs	r3, #3
 8002c7e:	61fb      	str	r3, [r7, #28]
 8002c80:	f107 0310 	add.w	r3, r7, #16
 8002c84:	4619      	mov	r1, r3
 8002c86:	4825      	ldr	r0, [pc, #148]	; (8002d1c <board_gpio_init+0x120>)
 8002c88:	f7fe f8c6 	bl	8000e18 <HAL_GPIO_Init>
 8002c8c:	2320      	movs	r3, #32
 8002c8e:	613b      	str	r3, [r7, #16]
 8002c90:	f107 0310 	add.w	r3, r7, #16
 8002c94:	4619      	mov	r1, r3
 8002c96:	4822      	ldr	r0, [pc, #136]	; (8002d20 <board_gpio_init+0x124>)
 8002c98:	f7fe f8be 	bl	8000e18 <HAL_GPIO_Init>
 8002c9c:	f44f 7380 	mov.w	r3, #256	; 0x100
 8002ca0:	613b      	str	r3, [r7, #16]
 8002ca2:	2301      	movs	r3, #1
 8002ca4:	617b      	str	r3, [r7, #20]
 8002ca6:	2301      	movs	r3, #1
 8002ca8:	61bb      	str	r3, [r7, #24]
 8002caa:	2303      	movs	r3, #3
 8002cac:	61fb      	str	r3, [r7, #28]
 8002cae:	f107 0310 	add.w	r3, r7, #16
 8002cb2:	4619      	mov	r1, r3
 8002cb4:	4819      	ldr	r0, [pc, #100]	; (8002d1c <board_gpio_init+0x120>)
 8002cb6:	f7fe f8af 	bl	8000e18 <HAL_GPIO_Init>
 8002cba:	2310      	movs	r3, #16
 8002cbc:	613b      	str	r3, [r7, #16]
 8002cbe:	2300      	movs	r3, #0
 8002cc0:	617b      	str	r3, [r7, #20]
 8002cc2:	2301      	movs	r3, #1
 8002cc4:	61bb      	str	r3, [r7, #24]
 8002cc6:	2303      	movs	r3, #3
 8002cc8:	61fb      	str	r3, [r7, #28]
 8002cca:	f107 0310 	add.w	r3, r7, #16
 8002cce:	4619      	mov	r1, r3
 8002cd0:	4813      	ldr	r0, [pc, #76]	; (8002d20 <board_gpio_init+0x124>)
 8002cd2:	f7fe f8a1 	bl	8000e18 <HAL_GPIO_Init>
 8002cd6:	2308      	movs	r3, #8
 8002cd8:	613b      	str	r3, [r7, #16]
 8002cda:	2300      	movs	r3, #0
 8002cdc:	617b      	str	r3, [r7, #20]
 8002cde:	2301      	movs	r3, #1
 8002ce0:	61bb      	str	r3, [r7, #24]
 8002ce2:	2303      	movs	r3, #3
 8002ce4:	61fb      	str	r3, [r7, #28]
 8002ce6:	f107 0310 	add.w	r3, r7, #16
 8002cea:	4619      	mov	r1, r3
 8002cec:	480c      	ldr	r0, [pc, #48]	; (8002d20 <board_gpio_init+0x124>)
 8002cee:	f7fe f893 	bl	8000e18 <HAL_GPIO_Init>
 8002cf2:	2301      	movs	r3, #1
 8002cf4:	613b      	str	r3, [r7, #16]
 8002cf6:	2300      	movs	r3, #0
 8002cf8:	617b      	str	r3, [r7, #20]
 8002cfa:	2302      	movs	r3, #2
 8002cfc:	61bb      	str	r3, [r7, #24]
 8002cfe:	2303      	movs	r3, #3
 8002d00:	61fb      	str	r3, [r7, #28]
 8002d02:	f107 0310 	add.w	r3, r7, #16
 8002d06:	4619      	mov	r1, r3
 8002d08:	4806      	ldr	r0, [pc, #24]	; (8002d24 <board_gpio_init+0x128>)
 8002d0a:	f7fe f885 	bl	8000e18 <HAL_GPIO_Init>
 8002d0e:	bf00      	nop
 8002d10:	3720      	adds	r7, #32
 8002d12:	46bd      	mov	sp, r7
 8002d14:	bd80      	pop	{r7, pc}
 8002d16:	bf00      	nop
 8002d18:	40021000 	.word	0x40021000
 8002d1c:	40010c00 	.word	0x40010c00
 8002d20:	40011800 	.word	0x40011800
 8002d24:	40010800 	.word	0x40010800

08002d28 <board_init>:
 8002d28:	b580      	push	{r7, lr}
 8002d2a:	af00      	add	r7, sp, #0
 8002d2c:	f7fd fbb6 	bl	800049c <HAL_Init>
 8002d30:	f7ff ff18 	bl	8002b64 <clock_init>
 8002d34:	f7fd fb40 	bl	80003b8 <SystemCoreClockUpdate>
 8002d38:	f000 f884 	bl	8002e44 <board_timer_stop>
 8002d3c:	f7ff ff5e 	bl	8002bfc <board_gpio_init>
 8002d40:	f000 f920 	bl	8002f84 <MX_USART1_UART_Init>
 8002d44:	bf00      	nop
 8002d46:	bd80      	pop	{r7, pc}

08002d48 <board_app_jump>:
 8002d48:	b580      	push	{r7, lr}
 8002d4a:	b084      	sub	sp, #16
 8002d4c:	af00      	add	r7, sp, #0
 8002d4e:	4b35      	ldr	r3, [pc, #212]	; (8002e24 <board_app_jump+0xdc>)
 8002d50:	60fb      	str	r3, [r7, #12]
 8002d52:	68fb      	ldr	r3, [r7, #12]
 8002d54:	681b      	ldr	r3, [r3, #0]
 8002d56:	60bb      	str	r3, [r7, #8]
 8002d58:	68fb      	ldr	r3, [r7, #12]
 8002d5a:	3304      	adds	r3, #4
 8002d5c:	681b      	ldr	r3, [r3, #0]
 8002d5e:	607b      	str	r3, [r7, #4]
 8002d60:	2120      	movs	r1, #32
 8002d62:	4831      	ldr	r0, [pc, #196]	; (8002e28 <board_app_jump+0xe0>)
 8002d64:	f7fe f9ec 	bl	8001140 <HAL_GPIO_DeInit>
 8002d68:	2120      	movs	r1, #32
 8002d6a:	4830      	ldr	r0, [pc, #192]	; (8002e2c <board_app_jump+0xe4>)
 8002d6c:	f7fe f9e8 	bl	8001140 <HAL_GPIO_DeInit>
 8002d70:	f44f 7180 	mov.w	r1, #256	; 0x100
 8002d74:	482c      	ldr	r0, [pc, #176]	; (8002e28 <board_app_jump+0xe0>)
 8002d76:	f7fe f9e3 	bl	8001140 <HAL_GPIO_DeInit>
 8002d7a:	2110      	movs	r1, #16
 8002d7c:	482b      	ldr	r0, [pc, #172]	; (8002e2c <board_app_jump+0xe4>)
 8002d7e:	f7fe f9df 	bl	8001140 <HAL_GPIO_DeInit>
 8002d82:	2108      	movs	r1, #8
 8002d84:	4829      	ldr	r0, [pc, #164]	; (8002e2c <board_app_jump+0xe4>)
 8002d86:	f7fe f9db 	bl	8001140 <HAL_GPIO_DeInit>
 8002d8a:	2101      	movs	r1, #1
 8002d8c:	4828      	ldr	r0, [pc, #160]	; (8002e30 <board_app_jump+0xe8>)
 8002d8e:	f7fe f9d7 	bl	8001140 <HAL_GPIO_DeInit>
 8002d92:	4b28      	ldr	r3, [pc, #160]	; (8002e34 <board_app_jump+0xec>)
 8002d94:	699b      	ldr	r3, [r3, #24]
 8002d96:	4a27      	ldr	r2, [pc, #156]	; (8002e34 <board_app_jump+0xec>)
 8002d98:	f023 0304 	bic.w	r3, r3, #4
 8002d9c:	6193      	str	r3, [r2, #24]
 8002d9e:	4b25      	ldr	r3, [pc, #148]	; (8002e34 <board_app_jump+0xec>)
 8002da0:	699b      	ldr	r3, [r3, #24]
 8002da2:	4a24      	ldr	r2, [pc, #144]	; (8002e34 <board_app_jump+0xec>)
 8002da4:	f023 0308 	bic.w	r3, r3, #8
 8002da8:	6193      	str	r3, [r2, #24]
 8002daa:	4b22      	ldr	r3, [pc, #136]	; (8002e34 <board_app_jump+0xec>)
 8002dac:	699b      	ldr	r3, [r3, #24]
 8002dae:	4a21      	ldr	r2, [pc, #132]	; (8002e34 <board_app_jump+0xec>)
 8002db0:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 8002db4:	6193      	str	r3, [r2, #24]
 8002db6:	4b1f      	ldr	r3, [pc, #124]	; (8002e34 <board_app_jump+0xec>)
 8002db8:	699b      	ldr	r3, [r3, #24]
 8002dba:	4a1e      	ldr	r2, [pc, #120]	; (8002e34 <board_app_jump+0xec>)
 8002dbc:	f023 0301 	bic.w	r3, r3, #1
 8002dc0:	6193      	str	r3, [r2, #24]
 8002dc2:	f7fe fab9 	bl	8001338 <HAL_RCC_DeInit>
 8002dc6:	f7fd fb7f 	bl	80004c8 <HAL_DeInit>
 8002dca:	4b1b      	ldr	r3, [pc, #108]	; (8002e38 <board_app_jump+0xf0>)
 8002dcc:	2200      	movs	r2, #0
 8002dce:	601a      	str	r2, [r3, #0]
 8002dd0:	4b19      	ldr	r3, [pc, #100]	; (8002e38 <board_app_jump+0xf0>)
 8002dd2:	2200      	movs	r2, #0
 8002dd4:	605a      	str	r2, [r3, #4]
 8002dd6:	4b18      	ldr	r3, [pc, #96]	; (8002e38 <board_app_jump+0xf0>)
 8002dd8:	2200      	movs	r2, #0
 8002dda:	609a      	str	r2, [r3, #8]
 8002ddc:	4b17      	ldr	r3, [pc, #92]	; (8002e3c <board_app_jump+0xf4>)
 8002dde:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8002de2:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 8002de6:	4b15      	ldr	r3, [pc, #84]	; (8002e3c <board_app_jump+0xf4>)
 8002de8:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8002dec:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
 8002df0:	4b12      	ldr	r3, [pc, #72]	; (8002e3c <board_app_jump+0xf4>)
 8002df2:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8002df6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8002dfa:	4b10      	ldr	r3, [pc, #64]	; (8002e3c <board_app_jump+0xf4>)
 8002dfc:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8002e00:	f8c3 208c 	str.w	r2, [r3, #140]	; 0x8c
 8002e04:	4b0e      	ldr	r3, [pc, #56]	; (8002e40 <board_app_jump+0xf8>)
 8002e06:	4a07      	ldr	r2, [pc, #28]	; (8002e24 <board_app_jump+0xdc>)
 8002e08:	609a      	str	r2, [r3, #8]
 8002e0a:	68bb      	ldr	r3, [r7, #8]
 8002e0c:	603b      	str	r3, [r7, #0]
 8002e0e:	683b      	ldr	r3, [r7, #0]
 8002e10:	f383 8808 	msr	MSP, r3
 8002e14:	bf00      	nop
 8002e16:	687b      	ldr	r3, [r7, #4]
 8002e18:	4798      	blx	r3
 8002e1a:	bf00      	nop
 8002e1c:	3710      	adds	r7, #16
 8002e1e:	46bd      	mov	sp, r7
 8002e20:	bd80      	pop	{r7, pc}
 8002e22:	bf00      	nop
 8002e24:	08010000 	.word	0x08010000
 8002e28:	40010c00 	.word	0x40010c00
 8002e2c:	40011800 	.word	0x40011800
 8002e30:	40010800 	.word	0x40010800
 8002e34:	40021000 	.word	0x40021000
 8002e38:	e000e010 	.word	0xe000e010
 8002e3c:	e000e100 	.word	0xe000e100
 8002e40:	e000ed00 	.word	0xe000ed00

08002e44 <board_timer_stop>:
 8002e44:	b480      	push	{r7}
 8002e46:	af00      	add	r7, sp, #0
 8002e48:	4b04      	ldr	r3, [pc, #16]	; (8002e5c <board_timer_stop+0x18>)
 8002e4a:	681b      	ldr	r3, [r3, #0]
 8002e4c:	4a03      	ldr	r2, [pc, #12]	; (8002e5c <board_timer_stop+0x18>)
 8002e4e:	f023 0301 	bic.w	r3, r3, #1
 8002e52:	6013      	str	r3, [r2, #0]
 8002e54:	bf00      	nop
 8002e56:	46bd      	mov	sp, r7
 8002e58:	bc80      	pop	{r7}
 8002e5a:	4770      	bx	lr
 8002e5c:	e000e010 	.word	0xe000e010

08002e60 <key_scan>:
 8002e60:	b580      	push	{r7, lr}
 8002e62:	b084      	sub	sp, #16
 8002e64:	af00      	add	r7, sp, #0
 8002e66:	4603      	mov	r3, r0
 8002e68:	71fb      	strb	r3, [r7, #7]
 8002e6a:	2300      	movs	r3, #0
 8002e6c:	73fb      	strb	r3, [r7, #15]
 8002e6e:	79fb      	ldrb	r3, [r7, #7]
 8002e70:	2b00      	cmp	r3, #0
 8002e72:	d002      	beq.n	8002e7a <key_scan+0x1a>
 8002e74:	4b2d      	ldr	r3, [pc, #180]	; (8002f2c <key_scan+0xcc>)
 8002e76:	2201      	movs	r2, #1
 8002e78:	701a      	strb	r2, [r3, #0]
 8002e7a:	4b2c      	ldr	r3, [pc, #176]	; (8002f2c <key_scan+0xcc>)
 8002e7c:	781b      	ldrb	r3, [r3, #0]
 8002e7e:	2b00      	cmp	r3, #0
 8002e80:	d036      	beq.n	8002ef0 <key_scan+0x90>
 8002e82:	2110      	movs	r1, #16
 8002e84:	482a      	ldr	r0, [pc, #168]	; (8002f30 <key_scan+0xd0>)
 8002e86:	f7fe fa27 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002e8a:	4603      	mov	r3, r0
 8002e8c:	2b00      	cmp	r3, #0
 8002e8e:	d00d      	beq.n	8002eac <key_scan+0x4c>
 8002e90:	2108      	movs	r1, #8
 8002e92:	4827      	ldr	r0, [pc, #156]	; (8002f30 <key_scan+0xd0>)
 8002e94:	f7fe fa20 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002e98:	4603      	mov	r3, r0
 8002e9a:	2b00      	cmp	r3, #0
 8002e9c:	d006      	beq.n	8002eac <key_scan+0x4c>
 8002e9e:	2101      	movs	r1, #1
 8002ea0:	4824      	ldr	r0, [pc, #144]	; (8002f34 <key_scan+0xd4>)
 8002ea2:	f7fe fa19 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002ea6:	4603      	mov	r3, r0
 8002ea8:	2b01      	cmp	r3, #1
 8002eaa:	d121      	bne.n	8002ef0 <key_scan+0x90>
 8002eac:	200a      	movs	r0, #10
 8002eae:	f7fd fb69 	bl	8000584 <HAL_Delay>
 8002eb2:	4b1e      	ldr	r3, [pc, #120]	; (8002f2c <key_scan+0xcc>)
 8002eb4:	2200      	movs	r2, #0
 8002eb6:	701a      	strb	r2, [r3, #0]
 8002eb8:	2110      	movs	r1, #16
 8002eba:	481d      	ldr	r0, [pc, #116]	; (8002f30 <key_scan+0xd0>)
 8002ebc:	f7fe fa0c 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002ec0:	4603      	mov	r3, r0
 8002ec2:	2b00      	cmp	r3, #0
 8002ec4:	d101      	bne.n	8002eca <key_scan+0x6a>
 8002ec6:	2301      	movs	r3, #1
 8002ec8:	73fb      	strb	r3, [r7, #15]
 8002eca:	2108      	movs	r1, #8
 8002ecc:	4818      	ldr	r0, [pc, #96]	; (8002f30 <key_scan+0xd0>)
 8002ece:	f7fe fa03 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002ed2:	4603      	mov	r3, r0
 8002ed4:	2b00      	cmp	r3, #0
 8002ed6:	d101      	bne.n	8002edc <key_scan+0x7c>
 8002ed8:	2302      	movs	r3, #2
 8002eda:	73fb      	strb	r3, [r7, #15]
 8002edc:	2101      	movs	r1, #1
 8002ede:	4815      	ldr	r0, [pc, #84]	; (8002f34 <key_scan+0xd4>)
 8002ee0:	f7fe f9fa 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002ee4:	4603      	mov	r3, r0
 8002ee6:	2b01      	cmp	r3, #1
 8002ee8:	d11a      	bne.n	8002f20 <key_scan+0xc0>
 8002eea:	2303      	movs	r3, #3
 8002eec:	73fb      	strb	r3, [r7, #15]
 8002eee:	e017      	b.n	8002f20 <key_scan+0xc0>
 8002ef0:	2110      	movs	r1, #16
 8002ef2:	480f      	ldr	r0, [pc, #60]	; (8002f30 <key_scan+0xd0>)
 8002ef4:	f7fe f9f0 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002ef8:	4603      	mov	r3, r0
 8002efa:	2b01      	cmp	r3, #1
 8002efc:	d110      	bne.n	8002f20 <key_scan+0xc0>
 8002efe:	2108      	movs	r1, #8
 8002f00:	480b      	ldr	r0, [pc, #44]	; (8002f30 <key_scan+0xd0>)
 8002f02:	f7fe f9e9 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002f06:	4603      	mov	r3, r0
 8002f08:	2b01      	cmp	r3, #1
 8002f0a:	d109      	bne.n	8002f20 <key_scan+0xc0>
 8002f0c:	2101      	movs	r1, #1
 8002f0e:	4809      	ldr	r0, [pc, #36]	; (8002f34 <key_scan+0xd4>)
 8002f10:	f7fe f9e2 	bl	80012d8 <HAL_GPIO_ReadPin>
 8002f14:	4603      	mov	r3, r0
 8002f16:	2b00      	cmp	r3, #0
 8002f18:	d102      	bne.n	8002f20 <key_scan+0xc0>
 8002f1a:	4b04      	ldr	r3, [pc, #16]	; (8002f2c <key_scan+0xcc>)
 8002f1c:	2201      	movs	r2, #1
 8002f1e:	701a      	strb	r2, [r3, #0]
 8002f20:	7bfb      	ldrb	r3, [r7, #15]
 8002f22:	4618      	mov	r0, r3
 8002f24:	3710      	adds	r7, #16
 8002f26:	46bd      	mov	sp, r7
 8002f28:	bd80      	pop	{r7, pc}
 8002f2a:	bf00      	nop
 8002f2c:	20000074 	.word	0x20000074
 8002f30:	40011800 	.word	0x40011800
 8002f34:	40010800 	.word	0x40010800

08002f38 <_write>:
 8002f38:	b480      	push	{r7}
 8002f3a:	b087      	sub	sp, #28
 8002f3c:	af00      	add	r7, sp, #0
 8002f3e:	60f8      	str	r0, [r7, #12]
 8002f40:	60b9      	str	r1, [r7, #8]
 8002f42:	607a      	str	r2, [r7, #4]
 8002f44:	2300      	movs	r3, #0
 8002f46:	617b      	str	r3, [r7, #20]
 8002f48:	e00f      	b.n	8002f6a <_write+0x32>
 8002f4a:	bf00      	nop
 8002f4c:	4b0c      	ldr	r3, [pc, #48]	; (8002f80 <_write+0x48>)
 8002f4e:	681b      	ldr	r3, [r3, #0]
 8002f50:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8002f54:	2b00      	cmp	r3, #0
 8002f56:	d0f9      	beq.n	8002f4c <_write+0x14>
 8002f58:	697b      	ldr	r3, [r7, #20]
 8002f5a:	68ba      	ldr	r2, [r7, #8]
 8002f5c:	4413      	add	r3, r2
 8002f5e:	781a      	ldrb	r2, [r3, #0]
 8002f60:	4b07      	ldr	r3, [pc, #28]	; (8002f80 <_write+0x48>)
 8002f62:	605a      	str	r2, [r3, #4]
 8002f64:	697b      	ldr	r3, [r7, #20]
 8002f66:	3301      	adds	r3, #1
 8002f68:	617b      	str	r3, [r7, #20]
 8002f6a:	697a      	ldr	r2, [r7, #20]
 8002f6c:	687b      	ldr	r3, [r7, #4]
 8002f6e:	429a      	cmp	r2, r3
 8002f70:	dbeb      	blt.n	8002f4a <_write+0x12>
 8002f72:	687b      	ldr	r3, [r7, #4]
 8002f74:	4618      	mov	r0, r3
 8002f76:	371c      	adds	r7, #28
 8002f78:	46bd      	mov	sp, r7
 8002f7a:	bc80      	pop	{r7}
 8002f7c:	4770      	bx	lr
 8002f7e:	bf00      	nop
 8002f80:	40013800 	.word	0x40013800

08002f84 <MX_USART1_UART_Init>:
 8002f84:	b580      	push	{r7, lr}
 8002f86:	af00      	add	r7, sp, #0
 8002f88:	4b11      	ldr	r3, [pc, #68]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002f8a:	4a12      	ldr	r2, [pc, #72]	; (8002fd4 <MX_USART1_UART_Init+0x50>)
 8002f8c:	601a      	str	r2, [r3, #0]
 8002f8e:	4b10      	ldr	r3, [pc, #64]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002f90:	f44f 32e1 	mov.w	r2, #115200	; 0x1c200
 8002f94:	605a      	str	r2, [r3, #4]
 8002f96:	4b0e      	ldr	r3, [pc, #56]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002f98:	2200      	movs	r2, #0
 8002f9a:	609a      	str	r2, [r3, #8]
 8002f9c:	4b0c      	ldr	r3, [pc, #48]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002f9e:	2200      	movs	r2, #0
 8002fa0:	60da      	str	r2, [r3, #12]
 8002fa2:	4b0b      	ldr	r3, [pc, #44]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002fa4:	2200      	movs	r2, #0
 8002fa6:	611a      	str	r2, [r3, #16]
 8002fa8:	4b09      	ldr	r3, [pc, #36]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002faa:	2200      	movs	r2, #0
 8002fac:	619a      	str	r2, [r3, #24]
 8002fae:	4b08      	ldr	r3, [pc, #32]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002fb0:	220c      	movs	r2, #12
 8002fb2:	615a      	str	r2, [r3, #20]
 8002fb4:	4b06      	ldr	r3, [pc, #24]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002fb6:	2200      	movs	r2, #0
 8002fb8:	619a      	str	r2, [r3, #24]
 8002fba:	4805      	ldr	r0, [pc, #20]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002fbc:	f7fe fe66 	bl	8001c8c <HAL_UART_Init>
 8002fc0:	2201      	movs	r2, #1
 8002fc2:	4905      	ldr	r1, [pc, #20]	; (8002fd8 <MX_USART1_UART_Init+0x54>)
 8002fc4:	4802      	ldr	r0, [pc, #8]	; (8002fd0 <MX_USART1_UART_Init+0x4c>)
 8002fc6:	f7fe feba 	bl	8001d3e <HAL_UART_Receive_IT>
 8002fca:	bf00      	nop
 8002fcc:	bd80      	pop	{r7, pc}
 8002fce:	bf00      	nop
 8002fd0:	200001c0 	.word	0x200001c0
 8002fd4:	40013800 	.word	0x40013800
 8002fd8:	2000de08 	.word	0x2000de08

08002fdc <USART1_IRQHandler>:
 8002fdc:	b580      	push	{r7, lr}
 8002fde:	af00      	add	r7, sp, #0
 8002fe0:	4807      	ldr	r0, [pc, #28]	; (8003000 <USART1_IRQHandler+0x24>)
 8002fe2:	f7fe fed1 	bl	8001d88 <HAL_UART_IRQHandler>
 8002fe6:	bf00      	nop
 8002fe8:	2201      	movs	r2, #1
 8002fea:	4906      	ldr	r1, [pc, #24]	; (8003004 <USART1_IRQHandler+0x28>)
 8002fec:	4804      	ldr	r0, [pc, #16]	; (8003000 <USART1_IRQHandler+0x24>)
 8002fee:	f7fe fea6 	bl	8001d3e <HAL_UART_Receive_IT>
 8002ff2:	4603      	mov	r3, r0
 8002ff4:	2b00      	cmp	r3, #0
 8002ff6:	d1f7      	bne.n	8002fe8 <USART1_IRQHandler+0xc>
 8002ff8:	bf00      	nop
 8002ffa:	bf00      	nop
 8002ffc:	bd80      	pop	{r7, pc}
 8002ffe:	bf00      	nop
 8003000:	200001c0 	.word	0x200001c0
 8003004:	2000de08 	.word	0x2000de08

08003008 <HAL_UART_RxCpltCallback>:
 8003008:	b580      	push	{r7, lr}
 800300a:	b082      	sub	sp, #8
 800300c:	af00      	add	r7, sp, #0
 800300e:	6078      	str	r0, [r7, #4]
 8003010:	687b      	ldr	r3, [r7, #4]
 8003012:	681b      	ldr	r3, [r3, #0]
 8003014:	4a04      	ldr	r2, [pc, #16]	; (8003028 <HAL_UART_RxCpltCallback+0x20>)
 8003016:	4293      	cmp	r3, r2
 8003018:	d101      	bne.n	800301e <HAL_UART_RxCpltCallback+0x16>
 800301a:	f000 f807 	bl	800302c <usart_recive_stream>
 800301e:	bf00      	nop
 8003020:	3708      	adds	r7, #8
 8003022:	46bd      	mov	sp, r7
 8003024:	bd80      	pop	{r7, pc}
 8003026:	bf00      	nop
 8003028:	40013800 	.word	0x40013800

0800302c <usart_recive_stream>:
 800302c:	b480      	push	{r7}
 800302e:	af00      	add	r7, sp, #0
 8003030:	4b09      	ldr	r3, [pc, #36]	; (8003058 <usart_recive_stream+0x2c>)
 8003032:	681b      	ldr	r3, [r3, #0]
 8003034:	f5b3 4f5c 	cmp.w	r3, #56320	; 0xdc00
 8003038:	d20a      	bcs.n	8003050 <usart_recive_stream+0x24>
 800303a:	4b07      	ldr	r3, [pc, #28]	; (8003058 <usart_recive_stream+0x2c>)
 800303c:	681b      	ldr	r3, [r3, #0]
 800303e:	4a07      	ldr	r2, [pc, #28]	; (800305c <usart_recive_stream+0x30>)
 8003040:	7811      	ldrb	r1, [r2, #0]
 8003042:	4a07      	ldr	r2, [pc, #28]	; (8003060 <usart_recive_stream+0x34>)
 8003044:	54d1      	strb	r1, [r2, r3]
 8003046:	4b04      	ldr	r3, [pc, #16]	; (8003058 <usart_recive_stream+0x2c>)
 8003048:	681b      	ldr	r3, [r3, #0]
 800304a:	3301      	adds	r3, #1
 800304c:	4a02      	ldr	r2, [pc, #8]	; (8003058 <usart_recive_stream+0x2c>)
 800304e:	6013      	str	r3, [r2, #0]
 8003050:	bf00      	nop
 8003052:	46bd      	mov	sp, r7
 8003054:	bc80      	pop	{r7}
 8003056:	4770      	bx	lr
 8003058:	2000de0c 	.word	0x2000de0c
 800305c:	2000de08 	.word	0x2000de08
 8003060:	20000208 	.word	0x20000208

08003064 <usart_recive_data_length>:
 8003064:	b580      	push	{r7, lr}
 8003066:	b082      	sub	sp, #8
 8003068:	af00      	add	r7, sp, #0
 800306a:	2300      	movs	r3, #0
 800306c:	603b      	str	r3, [r7, #0]
 800306e:	2300      	movs	r3, #0
 8003070:	607b      	str	r3, [r7, #4]
 8003072:	4b10      	ldr	r3, [pc, #64]	; (80030b4 <usart_recive_data_length+0x50>)
 8003074:	681b      	ldr	r3, [r3, #0]
 8003076:	2b00      	cmp	r3, #0
 8003078:	d017      	beq.n	80030aa <usart_recive_data_length+0x46>
 800307a:	4b0e      	ldr	r3, [pc, #56]	; (80030b4 <usart_recive_data_length+0x50>)
 800307c:	681b      	ldr	r3, [r3, #0]
 800307e:	683a      	ldr	r2, [r7, #0]
 8003080:	429a      	cmp	r2, r3
 8003082:	d10f      	bne.n	80030a4 <usart_recive_data_length+0x40>
 8003084:	4b0b      	ldr	r3, [pc, #44]	; (80030b4 <usart_recive_data_length+0x50>)
 8003086:	681b      	ldr	r3, [r3, #0]
 8003088:	607b      	str	r3, [r7, #4]
 800308a:	2300      	movs	r3, #0
 800308c:	603b      	str	r3, [r7, #0]
 800308e:	4b09      	ldr	r3, [pc, #36]	; (80030b4 <usart_recive_data_length+0x50>)
 8003090:	2200      	movs	r2, #0
 8003092:	601a      	str	r2, [r3, #0]
 8003094:	4808      	ldr	r0, [pc, #32]	; (80030b8 <usart_recive_data_length+0x54>)
 8003096:	f000 f86f 	bl	8003178 <iprintf>
 800309a:	6879      	ldr	r1, [r7, #4]
 800309c:	4807      	ldr	r0, [pc, #28]	; (80030bc <usart_recive_data_length+0x58>)
 800309e:	f000 f86b 	bl	8003178 <iprintf>
 80030a2:	e002      	b.n	80030aa <usart_recive_data_length+0x46>
 80030a4:	4b03      	ldr	r3, [pc, #12]	; (80030b4 <usart_recive_data_length+0x50>)
 80030a6:	681b      	ldr	r3, [r3, #0]
 80030a8:	603b      	str	r3, [r7, #0]
 80030aa:	687b      	ldr	r3, [r7, #4]
 80030ac:	4618      	mov	r0, r3
 80030ae:	3708      	adds	r7, #8
 80030b0:	46bd      	mov	sp, r7
 80030b2:	bd80      	pop	{r7, pc}
 80030b4:	2000de0c 	.word	0x2000de0c
 80030b8:	08004808 	.word	0x08004808
 80030bc:	08004828 	.word	0x08004828

080030c0 <usart_read>:
 80030c0:	b580      	push	{r7, lr}
 80030c2:	b086      	sub	sp, #24
 80030c4:	af00      	add	r7, sp, #0
 80030c6:	60f8      	str	r0, [r7, #12]
 80030c8:	60b9      	str	r1, [r7, #8]
 80030ca:	607a      	str	r2, [r7, #4]
 80030cc:	2300      	movs	r3, #0
 80030ce:	617b      	str	r3, [r7, #20]
 80030d0:	2300      	movs	r3, #0
 80030d2:	613b      	str	r3, [r7, #16]
 80030d4:	68fb      	ldr	r3, [r7, #12]
 80030d6:	2b00      	cmp	r3, #0
 80030d8:	d105      	bne.n	80030e6 <usart_read+0x26>
 80030da:	687b      	ldr	r3, [r7, #4]
 80030dc:	2b00      	cmp	r3, #0
 80030de:	d102      	bne.n	80030e6 <usart_read+0x26>
 80030e0:	2301      	movs	r3, #1
 80030e2:	617b      	str	r3, [r7, #20]
 80030e4:	e021      	b.n	800312a <usart_read+0x6a>
 80030e6:	f7ff ffbd 	bl	8003064 <usart_recive_data_length>
 80030ea:	6138      	str	r0, [r7, #16]
 80030ec:	4b11      	ldr	r3, [pc, #68]	; (8003134 <usart_read+0x74>)
 80030ee:	681b      	ldr	r3, [r3, #0]
 80030f0:	693a      	ldr	r2, [r7, #16]
 80030f2:	429a      	cmp	r2, r3
 80030f4:	d312      	bcc.n	800311c <usart_read+0x5c>
 80030f6:	4b0f      	ldr	r3, [pc, #60]	; (8003134 <usart_read+0x74>)
 80030f8:	681b      	ldr	r3, [r3, #0]
 80030fa:	4a0f      	ldr	r2, [pc, #60]	; (8003138 <usart_read+0x78>)
 80030fc:	4413      	add	r3, r2
 80030fe:	68ba      	ldr	r2, [r7, #8]
 8003100:	4619      	mov	r1, r3
 8003102:	68f8      	ldr	r0, [r7, #12]
 8003104:	f000 f82a 	bl	800315c <memcpy>
 8003108:	4b0a      	ldr	r3, [pc, #40]	; (8003134 <usart_read+0x74>)
 800310a:	681a      	ldr	r2, [r3, #0]
 800310c:	68bb      	ldr	r3, [r7, #8]
 800310e:	4413      	add	r3, r2
 8003110:	4a08      	ldr	r2, [pc, #32]	; (8003134 <usart_read+0x74>)
 8003112:	6013      	str	r3, [r2, #0]
 8003114:	687b      	ldr	r3, [r7, #4]
 8003116:	68ba      	ldr	r2, [r7, #8]
 8003118:	601a      	str	r2, [r3, #0]
 800311a:	e006      	b.n	800312a <usart_read+0x6a>
 800311c:	4b05      	ldr	r3, [pc, #20]	; (8003134 <usart_read+0x74>)
 800311e:	2200      	movs	r2, #0
 8003120:	601a      	str	r2, [r3, #0]
 8003122:	687b      	ldr	r3, [r7, #4]
 8003124:	2200      	movs	r2, #0
 8003126:	601a      	str	r2, [r3, #0]
 8003128:	bf00      	nop
 800312a:	697b      	ldr	r3, [r7, #20]
 800312c:	4618      	mov	r0, r3
 800312e:	3718      	adds	r7, #24
 8003130:	46bd      	mov	sp, r7
 8003132:	bd80      	pop	{r7, pc}
 8003134:	2000de10 	.word	0x2000de10
 8003138:	20000208 	.word	0x20000208

0800313c <memcmp>:
 800313c:	b510      	push	{r4, lr}
 800313e:	3901      	subs	r1, #1
 8003140:	4402      	add	r2, r0
 8003142:	4290      	cmp	r0, r2
 8003144:	d101      	bne.n	800314a <memcmp+0xe>
 8003146:	2000      	movs	r0, #0
 8003148:	e005      	b.n	8003156 <memcmp+0x1a>
 800314a:	7803      	ldrb	r3, [r0, #0]
 800314c:	f811 4f01 	ldrb.w	r4, [r1, #1]!
 8003150:	42a3      	cmp	r3, r4
 8003152:	d001      	beq.n	8003158 <memcmp+0x1c>
 8003154:	1b18      	subs	r0, r3, r4
 8003156:	bd10      	pop	{r4, pc}
 8003158:	3001      	adds	r0, #1
 800315a:	e7f2      	b.n	8003142 <memcmp+0x6>

0800315c <memcpy>:
 800315c:	440a      	add	r2, r1
 800315e:	4291      	cmp	r1, r2
 8003160:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
 8003164:	d100      	bne.n	8003168 <memcpy+0xc>
 8003166:	4770      	bx	lr
 8003168:	b510      	push	{r4, lr}
 800316a:	f811 4b01 	ldrb.w	r4, [r1], #1
 800316e:	4291      	cmp	r1, r2
 8003170:	f803 4f01 	strb.w	r4, [r3, #1]!
 8003174:	d1f9      	bne.n	800316a <memcpy+0xe>
 8003176:	bd10      	pop	{r4, pc}

08003178 <iprintf>:
 8003178:	b40f      	push	{r0, r1, r2, r3}
 800317a:	4b0a      	ldr	r3, [pc, #40]	; (80031a4 <iprintf+0x2c>)
 800317c:	b513      	push	{r0, r1, r4, lr}
 800317e:	681c      	ldr	r4, [r3, #0]
 8003180:	b124      	cbz	r4, 800318c <iprintf+0x14>
 8003182:	69a3      	ldr	r3, [r4, #24]
 8003184:	b913      	cbnz	r3, 800318c <iprintf+0x14>
 8003186:	4620      	mov	r0, r4
 8003188:	f000 fa8e 	bl	80036a8 <__sinit>
 800318c:	ab05      	add	r3, sp, #20
 800318e:	4620      	mov	r0, r4
 8003190:	9a04      	ldr	r2, [sp, #16]
 8003192:	68a1      	ldr	r1, [r4, #8]
 8003194:	9301      	str	r3, [sp, #4]
 8003196:	f000 fded 	bl	8003d74 <_vfiprintf_r>
 800319a:	b002      	add	sp, #8
 800319c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80031a0:	b004      	add	sp, #16
 80031a2:	4770      	bx	lr
 80031a4:	20000000 	.word	0x20000000

080031a8 <_puts_r>:
 80031a8:	b570      	push	{r4, r5, r6, lr}
 80031aa:	460e      	mov	r6, r1
 80031ac:	4605      	mov	r5, r0
 80031ae:	b118      	cbz	r0, 80031b8 <_puts_r+0x10>
 80031b0:	6983      	ldr	r3, [r0, #24]
 80031b2:	b90b      	cbnz	r3, 80031b8 <_puts_r+0x10>
 80031b4:	f000 fa78 	bl	80036a8 <__sinit>
 80031b8:	69ab      	ldr	r3, [r5, #24]
 80031ba:	68ac      	ldr	r4, [r5, #8]
 80031bc:	b913      	cbnz	r3, 80031c4 <_puts_r+0x1c>
 80031be:	4628      	mov	r0, r5
 80031c0:	f000 fa72 	bl	80036a8 <__sinit>
 80031c4:	4b2c      	ldr	r3, [pc, #176]	; (8003278 <_puts_r+0xd0>)
 80031c6:	429c      	cmp	r4, r3
 80031c8:	d120      	bne.n	800320c <_puts_r+0x64>
 80031ca:	686c      	ldr	r4, [r5, #4]
 80031cc:	6e63      	ldr	r3, [r4, #100]	; 0x64
 80031ce:	07db      	lsls	r3, r3, #31
 80031d0:	d405      	bmi.n	80031de <_puts_r+0x36>
 80031d2:	89a3      	ldrh	r3, [r4, #12]
 80031d4:	0598      	lsls	r0, r3, #22
 80031d6:	d402      	bmi.n	80031de <_puts_r+0x36>
 80031d8:	6da0      	ldr	r0, [r4, #88]	; 0x58
 80031da:	f000 fb03 	bl	80037e4 <__retarget_lock_acquire_recursive>
 80031de:	89a3      	ldrh	r3, [r4, #12]
 80031e0:	0719      	lsls	r1, r3, #28
 80031e2:	d51d      	bpl.n	8003220 <_puts_r+0x78>
 80031e4:	6923      	ldr	r3, [r4, #16]
 80031e6:	b1db      	cbz	r3, 8003220 <_puts_r+0x78>
 80031e8:	3e01      	subs	r6, #1
 80031ea:	68a3      	ldr	r3, [r4, #8]
 80031ec:	f816 1f01 	ldrb.w	r1, [r6, #1]!
 80031f0:	3b01      	subs	r3, #1
 80031f2:	60a3      	str	r3, [r4, #8]
 80031f4:	bb39      	cbnz	r1, 8003246 <_puts_r+0x9e>
 80031f6:	2b00      	cmp	r3, #0
 80031f8:	da38      	bge.n	800326c <_puts_r+0xc4>
 80031fa:	4622      	mov	r2, r4
 80031fc:	210a      	movs	r1, #10
 80031fe:	4628      	mov	r0, r5
 8003200:	f000 f87c 	bl	80032fc <__swbuf_r>
 8003204:	3001      	adds	r0, #1
 8003206:	d011      	beq.n	800322c <_puts_r+0x84>
 8003208:	250a      	movs	r5, #10
 800320a:	e011      	b.n	8003230 <_puts_r+0x88>
 800320c:	4b1b      	ldr	r3, [pc, #108]	; (800327c <_puts_r+0xd4>)
 800320e:	429c      	cmp	r4, r3
 8003210:	d101      	bne.n	8003216 <_puts_r+0x6e>
 8003212:	68ac      	ldr	r4, [r5, #8]
 8003214:	e7da      	b.n	80031cc <_puts_r+0x24>
 8003216:	4b1a      	ldr	r3, [pc, #104]	; (8003280 <_puts_r+0xd8>)
 8003218:	429c      	cmp	r4, r3
 800321a:	bf08      	it	eq
 800321c:	68ec      	ldreq	r4, [r5, #12]
 800321e:	e7d5      	b.n	80031cc <_puts_r+0x24>
 8003220:	4621      	mov	r1, r4
 8003222:	4628      	mov	r0, r5
 8003224:	f000 f8bc 	bl	80033a0 <__swsetup_r>
 8003228:	2800      	cmp	r0, #0
 800322a:	d0dd      	beq.n	80031e8 <_puts_r+0x40>
 800322c:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
 8003230:	6e63      	ldr	r3, [r4, #100]	; 0x64
 8003232:	07da      	lsls	r2, r3, #31
 8003234:	d405      	bmi.n	8003242 <_puts_r+0x9a>
 8003236:	89a3      	ldrh	r3, [r4, #12]
 8003238:	059b      	lsls	r3, r3, #22
 800323a:	d402      	bmi.n	8003242 <_puts_r+0x9a>
 800323c:	6da0      	ldr	r0, [r4, #88]	; 0x58
 800323e:	f000 fad2 	bl	80037e6 <__retarget_lock_release_recursive>
 8003242:	4628      	mov	r0, r5
 8003244:	bd70      	pop	{r4, r5, r6, pc}
 8003246:	2b00      	cmp	r3, #0
 8003248:	da04      	bge.n	8003254 <_puts_r+0xac>
 800324a:	69a2      	ldr	r2, [r4, #24]
 800324c:	429a      	cmp	r2, r3
 800324e:	dc06      	bgt.n	800325e <_puts_r+0xb6>
 8003250:	290a      	cmp	r1, #10
 8003252:	d004      	beq.n	800325e <_puts_r+0xb6>
 8003254:	6823      	ldr	r3, [r4, #0]
 8003256:	1c5a      	adds	r2, r3, #1
 8003258:	6022      	str	r2, [r4, #0]
 800325a:	7019      	strb	r1, [r3, #0]
 800325c:	e7c5      	b.n	80031ea <_puts_r+0x42>
 800325e:	4622      	mov	r2, r4
 8003260:	4628      	mov	r0, r5
 8003262:	f000 f84b 	bl	80032fc <__swbuf_r>
 8003266:	3001      	adds	r0, #1
 8003268:	d1bf      	bne.n	80031ea <_puts_r+0x42>
 800326a:	e7df      	b.n	800322c <_puts_r+0x84>
 800326c:	250a      	movs	r5, #10
 800326e:	6823      	ldr	r3, [r4, #0]
 8003270:	1c5a      	adds	r2, r3, #1
 8003272:	6022      	str	r2, [r4, #0]
 8003274:	701d      	strb	r5, [r3, #0]
 8003276:	e7db      	b.n	8003230 <_puts_r+0x88>
 8003278:	08004890 	.word	0x08004890
 800327c:	080048b0 	.word	0x080048b0
 8003280:	08004870 	.word	0x08004870

08003284 <puts>:
 8003284:	4b02      	ldr	r3, [pc, #8]	; (8003290 <puts+0xc>)
 8003286:	4601      	mov	r1, r0
 8003288:	6818      	ldr	r0, [r3, #0]
 800328a:	f7ff bf8d 	b.w	80031a8 <_puts_r>
 800328e:	bf00      	nop
 8003290:	20000000 	.word	0x20000000

08003294 <siprintf>:
 8003294:	b40e      	push	{r1, r2, r3}
 8003296:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
 800329a:	b500      	push	{lr}
 800329c:	b09c      	sub	sp, #112	; 0x70
 800329e:	ab1d      	add	r3, sp, #116	; 0x74
 80032a0:	9002      	str	r0, [sp, #8]
 80032a2:	9006      	str	r0, [sp, #24]
 80032a4:	9107      	str	r1, [sp, #28]
 80032a6:	9104      	str	r1, [sp, #16]
 80032a8:	4808      	ldr	r0, [pc, #32]	; (80032cc <siprintf+0x38>)
 80032aa:	4909      	ldr	r1, [pc, #36]	; (80032d0 <siprintf+0x3c>)
 80032ac:	f853 2b04 	ldr.w	r2, [r3], #4
 80032b0:	9105      	str	r1, [sp, #20]
 80032b2:	6800      	ldr	r0, [r0, #0]
 80032b4:	a902      	add	r1, sp, #8
 80032b6:	9301      	str	r3, [sp, #4]
 80032b8:	f000 fc34 	bl	8003b24 <_svfiprintf_r>
 80032bc:	2200      	movs	r2, #0
 80032be:	9b02      	ldr	r3, [sp, #8]
 80032c0:	701a      	strb	r2, [r3, #0]
 80032c2:	b01c      	add	sp, #112	; 0x70
 80032c4:	f85d eb04 	ldr.w	lr, [sp], #4
 80032c8:	b003      	add	sp, #12
 80032ca:	4770      	bx	lr
 80032cc:	20000000 	.word	0x20000000
 80032d0:	ffff0208 	.word	0xffff0208

080032d4 <strncmp>:
 80032d4:	4603      	mov	r3, r0
 80032d6:	b510      	push	{r4, lr}
 80032d8:	b172      	cbz	r2, 80032f8 <strncmp+0x24>
 80032da:	3901      	subs	r1, #1
 80032dc:	1884      	adds	r4, r0, r2
 80032de:	f813 0b01 	ldrb.w	r0, [r3], #1
 80032e2:	f811 2f01 	ldrb.w	r2, [r1, #1]!
 80032e6:	4290      	cmp	r0, r2
 80032e8:	d101      	bne.n	80032ee <strncmp+0x1a>
 80032ea:	42a3      	cmp	r3, r4
 80032ec:	d101      	bne.n	80032f2 <strncmp+0x1e>
 80032ee:	1a80      	subs	r0, r0, r2
 80032f0:	bd10      	pop	{r4, pc}
 80032f2:	2800      	cmp	r0, #0
 80032f4:	d1f3      	bne.n	80032de <strncmp+0xa>
 80032f6:	e7fa      	b.n	80032ee <strncmp+0x1a>
 80032f8:	4610      	mov	r0, r2
 80032fa:	e7f9      	b.n	80032f0 <strncmp+0x1c>

080032fc <__swbuf_r>:
 80032fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80032fe:	460e      	mov	r6, r1
 8003300:	4614      	mov	r4, r2
 8003302:	4605      	mov	r5, r0
 8003304:	b118      	cbz	r0, 800330e <__swbuf_r+0x12>
 8003306:	6983      	ldr	r3, [r0, #24]
 8003308:	b90b      	cbnz	r3, 800330e <__swbuf_r+0x12>
 800330a:	f000 f9cd 	bl	80036a8 <__sinit>
 800330e:	4b21      	ldr	r3, [pc, #132]	; (8003394 <__swbuf_r+0x98>)
 8003310:	429c      	cmp	r4, r3
 8003312:	d12b      	bne.n	800336c <__swbuf_r+0x70>
 8003314:	686c      	ldr	r4, [r5, #4]
 8003316:	69a3      	ldr	r3, [r4, #24]
 8003318:	60a3      	str	r3, [r4, #8]
 800331a:	89a3      	ldrh	r3, [r4, #12]
 800331c:	071a      	lsls	r2, r3, #28
 800331e:	d52f      	bpl.n	8003380 <__swbuf_r+0x84>
 8003320:	6923      	ldr	r3, [r4, #16]
 8003322:	b36b      	cbz	r3, 8003380 <__swbuf_r+0x84>
 8003324:	6923      	ldr	r3, [r4, #16]
 8003326:	6820      	ldr	r0, [r4, #0]
 8003328:	b2f6      	uxtb	r6, r6
 800332a:	1ac0      	subs	r0, r0, r3
 800332c:	6963      	ldr	r3, [r4, #20]
 800332e:	4637      	mov	r7, r6
 8003330:	4283      	cmp	r3, r0
 8003332:	dc04      	bgt.n	800333e <__swbuf_r+0x42>
 8003334:	4621      	mov	r1, r4
 8003336:	4628      	mov	r0, r5
 8003338:	f000 f922 	bl	8003580 <_fflush_r>
 800333c:	bb30      	cbnz	r0, 800338c <__swbuf_r+0x90>
 800333e:	68a3      	ldr	r3, [r4, #8]
 8003340:	3001      	adds	r0, #1
 8003342:	3b01      	subs	r3, #1
 8003344:	60a3      	str	r3, [r4, #8]
 8003346:	6823      	ldr	r3, [r4, #0]
 8003348:	1c5a      	adds	r2, r3, #1
 800334a:	6022      	str	r2, [r4, #0]
 800334c:	701e      	strb	r6, [r3, #0]
 800334e:	6963      	ldr	r3, [r4, #20]
 8003350:	4283      	cmp	r3, r0
 8003352:	d004      	beq.n	800335e <__swbuf_r+0x62>
 8003354:	89a3      	ldrh	r3, [r4, #12]
 8003356:	07db      	lsls	r3, r3, #31
 8003358:	d506      	bpl.n	8003368 <__swbuf_r+0x6c>
 800335a:	2e0a      	cmp	r6, #10
 800335c:	d104      	bne.n	8003368 <__swbuf_r+0x6c>
 800335e:	4621      	mov	r1, r4
 8003360:	4628      	mov	r0, r5
 8003362:	f000 f90d 	bl	8003580 <_fflush_r>
 8003366:	b988      	cbnz	r0, 800338c <__swbuf_r+0x90>
 8003368:	4638      	mov	r0, r7
 800336a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800336c:	4b0a      	ldr	r3, [pc, #40]	; (8003398 <__swbuf_r+0x9c>)
 800336e:	429c      	cmp	r4, r3
 8003370:	d101      	bne.n	8003376 <__swbuf_r+0x7a>
 8003372:	68ac      	ldr	r4, [r5, #8]
 8003374:	e7cf      	b.n	8003316 <__swbuf_r+0x1a>
 8003376:	4b09      	ldr	r3, [pc, #36]	; (800339c <__swbuf_r+0xa0>)
 8003378:	429c      	cmp	r4, r3
 800337a:	bf08      	it	eq
 800337c:	68ec      	ldreq	r4, [r5, #12]
 800337e:	e7ca      	b.n	8003316 <__swbuf_r+0x1a>
 8003380:	4621      	mov	r1, r4
 8003382:	4628      	mov	r0, r5
 8003384:	f000 f80c 	bl	80033a0 <__swsetup_r>
 8003388:	2800      	cmp	r0, #0
 800338a:	d0cb      	beq.n	8003324 <__swbuf_r+0x28>
 800338c:	f04f 37ff 	mov.w	r7, #4294967295	; 0xffffffff
 8003390:	e7ea      	b.n	8003368 <__swbuf_r+0x6c>
 8003392:	bf00      	nop
 8003394:	08004890 	.word	0x08004890
 8003398:	080048b0 	.word	0x080048b0
 800339c:	08004870 	.word	0x08004870

080033a0 <__swsetup_r>:
 80033a0:	4b32      	ldr	r3, [pc, #200]	; (800346c <__swsetup_r+0xcc>)
 80033a2:	b570      	push	{r4, r5, r6, lr}
 80033a4:	681d      	ldr	r5, [r3, #0]
 80033a6:	4606      	mov	r6, r0
 80033a8:	460c      	mov	r4, r1
 80033aa:	b125      	cbz	r5, 80033b6 <__swsetup_r+0x16>
 80033ac:	69ab      	ldr	r3, [r5, #24]
 80033ae:	b913      	cbnz	r3, 80033b6 <__swsetup_r+0x16>
 80033b0:	4628      	mov	r0, r5
 80033b2:	f000 f979 	bl	80036a8 <__sinit>
 80033b6:	4b2e      	ldr	r3, [pc, #184]	; (8003470 <__swsetup_r+0xd0>)
 80033b8:	429c      	cmp	r4, r3
 80033ba:	d10f      	bne.n	80033dc <__swsetup_r+0x3c>
 80033bc:	686c      	ldr	r4, [r5, #4]
 80033be:	89a3      	ldrh	r3, [r4, #12]
 80033c0:	f9b4 200c 	ldrsh.w	r2, [r4, #12]
 80033c4:	0719      	lsls	r1, r3, #28
 80033c6:	d42c      	bmi.n	8003422 <__swsetup_r+0x82>
 80033c8:	06dd      	lsls	r5, r3, #27
 80033ca:	d411      	bmi.n	80033f0 <__swsetup_r+0x50>
 80033cc:	2309      	movs	r3, #9
 80033ce:	6033      	str	r3, [r6, #0]
 80033d0:	f042 0340 	orr.w	r3, r2, #64	; 0x40
 80033d4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80033d8:	81a3      	strh	r3, [r4, #12]
 80033da:	e03e      	b.n	800345a <__swsetup_r+0xba>
 80033dc:	4b25      	ldr	r3, [pc, #148]	; (8003474 <__swsetup_r+0xd4>)
 80033de:	429c      	cmp	r4, r3
 80033e0:	d101      	bne.n	80033e6 <__swsetup_r+0x46>
 80033e2:	68ac      	ldr	r4, [r5, #8]
 80033e4:	e7eb      	b.n	80033be <__swsetup_r+0x1e>
 80033e6:	4b24      	ldr	r3, [pc, #144]	; (8003478 <__swsetup_r+0xd8>)
 80033e8:	429c      	cmp	r4, r3
 80033ea:	bf08      	it	eq
 80033ec:	68ec      	ldreq	r4, [r5, #12]
 80033ee:	e7e6      	b.n	80033be <__swsetup_r+0x1e>
 80033f0:	0758      	lsls	r0, r3, #29
 80033f2:	d512      	bpl.n	800341a <__swsetup_r+0x7a>
 80033f4:	6b61      	ldr	r1, [r4, #52]	; 0x34
 80033f6:	b141      	cbz	r1, 800340a <__swsetup_r+0x6a>
 80033f8:	f104 0344 	add.w	r3, r4, #68	; 0x44
 80033fc:	4299      	cmp	r1, r3
 80033fe:	d002      	beq.n	8003406 <__swsetup_r+0x66>
 8003400:	4630      	mov	r0, r6
 8003402:	f000 fa57 	bl	80038b4 <_free_r>
 8003406:	2300      	movs	r3, #0
 8003408:	6363      	str	r3, [r4, #52]	; 0x34
 800340a:	89a3      	ldrh	r3, [r4, #12]
 800340c:	f023 0324 	bic.w	r3, r3, #36	; 0x24
 8003410:	81a3      	strh	r3, [r4, #12]
 8003412:	2300      	movs	r3, #0
 8003414:	6063      	str	r3, [r4, #4]
 8003416:	6923      	ldr	r3, [r4, #16]
 8003418:	6023      	str	r3, [r4, #0]
 800341a:	89a3      	ldrh	r3, [r4, #12]
 800341c:	f043 0308 	orr.w	r3, r3, #8
 8003420:	81a3      	strh	r3, [r4, #12]
 8003422:	6923      	ldr	r3, [r4, #16]
 8003424:	b94b      	cbnz	r3, 800343a <__swsetup_r+0x9a>
 8003426:	89a3      	ldrh	r3, [r4, #12]
 8003428:	f403 7320 	and.w	r3, r3, #640	; 0x280
 800342c:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
 8003430:	d003      	beq.n	800343a <__swsetup_r+0x9a>
 8003432:	4621      	mov	r1, r4
 8003434:	4630      	mov	r0, r6
 8003436:	f000 f9fd 	bl	8003834 <__smakebuf_r>
 800343a:	89a0      	ldrh	r0, [r4, #12]
 800343c:	f9b4 200c 	ldrsh.w	r2, [r4, #12]
 8003440:	f010 0301 	ands.w	r3, r0, #1
 8003444:	d00a      	beq.n	800345c <__swsetup_r+0xbc>
 8003446:	2300      	movs	r3, #0
 8003448:	60a3      	str	r3, [r4, #8]
 800344a:	6963      	ldr	r3, [r4, #20]
 800344c:	425b      	negs	r3, r3
 800344e:	61a3      	str	r3, [r4, #24]
 8003450:	6923      	ldr	r3, [r4, #16]
 8003452:	b943      	cbnz	r3, 8003466 <__swsetup_r+0xc6>
 8003454:	f010 0080 	ands.w	r0, r0, #128	; 0x80
 8003458:	d1ba      	bne.n	80033d0 <__swsetup_r+0x30>
 800345a:	bd70      	pop	{r4, r5, r6, pc}
 800345c:	0781      	lsls	r1, r0, #30
 800345e:	bf58      	it	pl
 8003460:	6963      	ldrpl	r3, [r4, #20]
 8003462:	60a3      	str	r3, [r4, #8]
 8003464:	e7f4      	b.n	8003450 <__swsetup_r+0xb0>
 8003466:	2000      	movs	r0, #0
 8003468:	e7f7      	b.n	800345a <__swsetup_r+0xba>
 800346a:	bf00      	nop
 800346c:	20000000 	.word	0x20000000
 8003470:	08004890 	.word	0x08004890
 8003474:	080048b0 	.word	0x080048b0
 8003478:	08004870 	.word	0x08004870

0800347c <__sflush_r>:
 800347c:	898a      	ldrh	r2, [r1, #12]
 800347e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8003480:	4605      	mov	r5, r0
 8003482:	0710      	lsls	r0, r2, #28
 8003484:	460c      	mov	r4, r1
 8003486:	d457      	bmi.n	8003538 <__sflush_r+0xbc>
 8003488:	684b      	ldr	r3, [r1, #4]
 800348a:	2b00      	cmp	r3, #0
 800348c:	dc04      	bgt.n	8003498 <__sflush_r+0x1c>
 800348e:	6c0b      	ldr	r3, [r1, #64]	; 0x40
 8003490:	2b00      	cmp	r3, #0
 8003492:	dc01      	bgt.n	8003498 <__sflush_r+0x1c>
 8003494:	2000      	movs	r0, #0
 8003496:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8003498:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 800349a:	2e00      	cmp	r6, #0
 800349c:	d0fa      	beq.n	8003494 <__sflush_r+0x18>
 800349e:	2300      	movs	r3, #0
 80034a0:	f412 5280 	ands.w	r2, r2, #4096	; 0x1000
 80034a4:	682f      	ldr	r7, [r5, #0]
 80034a6:	602b      	str	r3, [r5, #0]
 80034a8:	d032      	beq.n	8003510 <__sflush_r+0x94>
 80034aa:	6d60      	ldr	r0, [r4, #84]	; 0x54
 80034ac:	89a3      	ldrh	r3, [r4, #12]
 80034ae:	075a      	lsls	r2, r3, #29
 80034b0:	d505      	bpl.n	80034be <__sflush_r+0x42>
 80034b2:	6863      	ldr	r3, [r4, #4]
 80034b4:	1ac0      	subs	r0, r0, r3
 80034b6:	6b63      	ldr	r3, [r4, #52]	; 0x34
 80034b8:	b10b      	cbz	r3, 80034be <__sflush_r+0x42>
 80034ba:	6c23      	ldr	r3, [r4, #64]	; 0x40
 80034bc:	1ac0      	subs	r0, r0, r3
 80034be:	2300      	movs	r3, #0
 80034c0:	4602      	mov	r2, r0
 80034c2:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
 80034c4:	4628      	mov	r0, r5
 80034c6:	6a21      	ldr	r1, [r4, #32]
 80034c8:	47b0      	blx	r6
 80034ca:	1c43      	adds	r3, r0, #1
 80034cc:	89a3      	ldrh	r3, [r4, #12]
 80034ce:	d106      	bne.n	80034de <__sflush_r+0x62>
 80034d0:	6829      	ldr	r1, [r5, #0]
 80034d2:	291d      	cmp	r1, #29
 80034d4:	d82c      	bhi.n	8003530 <__sflush_r+0xb4>
 80034d6:	4a29      	ldr	r2, [pc, #164]	; (800357c <__sflush_r+0x100>)
 80034d8:	40ca      	lsrs	r2, r1
 80034da:	07d6      	lsls	r6, r2, #31
 80034dc:	d528      	bpl.n	8003530 <__sflush_r+0xb4>
 80034de:	2200      	movs	r2, #0
 80034e0:	6062      	str	r2, [r4, #4]
 80034e2:	6922      	ldr	r2, [r4, #16]
 80034e4:	04d9      	lsls	r1, r3, #19
 80034e6:	6022      	str	r2, [r4, #0]
 80034e8:	d504      	bpl.n	80034f4 <__sflush_r+0x78>
 80034ea:	1c42      	adds	r2, r0, #1
 80034ec:	d101      	bne.n	80034f2 <__sflush_r+0x76>
 80034ee:	682b      	ldr	r3, [r5, #0]
 80034f0:	b903      	cbnz	r3, 80034f4 <__sflush_r+0x78>
 80034f2:	6560      	str	r0, [r4, #84]	; 0x54
 80034f4:	6b61      	ldr	r1, [r4, #52]	; 0x34
 80034f6:	602f      	str	r7, [r5, #0]
 80034f8:	2900      	cmp	r1, #0
 80034fa:	d0cb      	beq.n	8003494 <__sflush_r+0x18>
 80034fc:	f104 0344 	add.w	r3, r4, #68	; 0x44
 8003500:	4299      	cmp	r1, r3
 8003502:	d002      	beq.n	800350a <__sflush_r+0x8e>
 8003504:	4628      	mov	r0, r5
 8003506:	f000 f9d5 	bl	80038b4 <_free_r>
 800350a:	2000      	movs	r0, #0
 800350c:	6360      	str	r0, [r4, #52]	; 0x34
 800350e:	e7c2      	b.n	8003496 <__sflush_r+0x1a>
 8003510:	6a21      	ldr	r1, [r4, #32]
 8003512:	2301      	movs	r3, #1
 8003514:	4628      	mov	r0, r5
 8003516:	47b0      	blx	r6
 8003518:	1c41      	adds	r1, r0, #1
 800351a:	d1c7      	bne.n	80034ac <__sflush_r+0x30>
 800351c:	682b      	ldr	r3, [r5, #0]
 800351e:	2b00      	cmp	r3, #0
 8003520:	d0c4      	beq.n	80034ac <__sflush_r+0x30>
 8003522:	2b1d      	cmp	r3, #29
 8003524:	d001      	beq.n	800352a <__sflush_r+0xae>
 8003526:	2b16      	cmp	r3, #22
 8003528:	d101      	bne.n	800352e <__sflush_r+0xb2>
 800352a:	602f      	str	r7, [r5, #0]
 800352c:	e7b2      	b.n	8003494 <__sflush_r+0x18>
 800352e:	89a3      	ldrh	r3, [r4, #12]
 8003530:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8003534:	81a3      	strh	r3, [r4, #12]
 8003536:	e7ae      	b.n	8003496 <__sflush_r+0x1a>
 8003538:	690f      	ldr	r7, [r1, #16]
 800353a:	2f00      	cmp	r7, #0
 800353c:	d0aa      	beq.n	8003494 <__sflush_r+0x18>
 800353e:	0793      	lsls	r3, r2, #30
 8003540:	bf18      	it	ne
 8003542:	2300      	movne	r3, #0
 8003544:	680e      	ldr	r6, [r1, #0]
 8003546:	bf08      	it	eq
 8003548:	694b      	ldreq	r3, [r1, #20]
 800354a:	1bf6      	subs	r6, r6, r7
 800354c:	600f      	str	r7, [r1, #0]
 800354e:	608b      	str	r3, [r1, #8]
 8003550:	2e00      	cmp	r6, #0
 8003552:	dd9f      	ble.n	8003494 <__sflush_r+0x18>
 8003554:	4633      	mov	r3, r6
 8003556:	463a      	mov	r2, r7
 8003558:	4628      	mov	r0, r5
 800355a:	6a21      	ldr	r1, [r4, #32]
 800355c:	f8d4 c028 	ldr.w	ip, [r4, #40]	; 0x28
 8003560:	47e0      	blx	ip
 8003562:	2800      	cmp	r0, #0
 8003564:	dc06      	bgt.n	8003574 <__sflush_r+0xf8>
 8003566:	89a3      	ldrh	r3, [r4, #12]
 8003568:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800356c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8003570:	81a3      	strh	r3, [r4, #12]
 8003572:	e790      	b.n	8003496 <__sflush_r+0x1a>
 8003574:	4407      	add	r7, r0
 8003576:	1a36      	subs	r6, r6, r0
 8003578:	e7ea      	b.n	8003550 <__sflush_r+0xd4>
 800357a:	bf00      	nop
 800357c:	20400001 	.word	0x20400001

08003580 <_fflush_r>:
 8003580:	b538      	push	{r3, r4, r5, lr}
 8003582:	690b      	ldr	r3, [r1, #16]
 8003584:	4605      	mov	r5, r0
 8003586:	460c      	mov	r4, r1
 8003588:	b913      	cbnz	r3, 8003590 <_fflush_r+0x10>
 800358a:	2500      	movs	r5, #0
 800358c:	4628      	mov	r0, r5
 800358e:	bd38      	pop	{r3, r4, r5, pc}
 8003590:	b118      	cbz	r0, 800359a <_fflush_r+0x1a>
 8003592:	6983      	ldr	r3, [r0, #24]
 8003594:	b90b      	cbnz	r3, 800359a <_fflush_r+0x1a>
 8003596:	f000 f887 	bl	80036a8 <__sinit>
 800359a:	4b14      	ldr	r3, [pc, #80]	; (80035ec <_fflush_r+0x6c>)
 800359c:	429c      	cmp	r4, r3
 800359e:	d11b      	bne.n	80035d8 <_fflush_r+0x58>
 80035a0:	686c      	ldr	r4, [r5, #4]
 80035a2:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 80035a6:	2b00      	cmp	r3, #0
 80035a8:	d0ef      	beq.n	800358a <_fflush_r+0xa>
 80035aa:	6e62      	ldr	r2, [r4, #100]	; 0x64
 80035ac:	07d0      	lsls	r0, r2, #31
 80035ae:	d404      	bmi.n	80035ba <_fflush_r+0x3a>
 80035b0:	0599      	lsls	r1, r3, #22
 80035b2:	d402      	bmi.n	80035ba <_fflush_r+0x3a>
 80035b4:	6da0      	ldr	r0, [r4, #88]	; 0x58
 80035b6:	f000 f915 	bl	80037e4 <__retarget_lock_acquire_recursive>
 80035ba:	4628      	mov	r0, r5
 80035bc:	4621      	mov	r1, r4
 80035be:	f7ff ff5d 	bl	800347c <__sflush_r>
 80035c2:	6e63      	ldr	r3, [r4, #100]	; 0x64
 80035c4:	4605      	mov	r5, r0
 80035c6:	07da      	lsls	r2, r3, #31
 80035c8:	d4e0      	bmi.n	800358c <_fflush_r+0xc>
 80035ca:	89a3      	ldrh	r3, [r4, #12]
 80035cc:	059b      	lsls	r3, r3, #22
 80035ce:	d4dd      	bmi.n	800358c <_fflush_r+0xc>
 80035d0:	6da0      	ldr	r0, [r4, #88]	; 0x58
 80035d2:	f000 f908 	bl	80037e6 <__retarget_lock_release_recursive>
 80035d6:	e7d9      	b.n	800358c <_fflush_r+0xc>
 80035d8:	4b05      	ldr	r3, [pc, #20]	; (80035f0 <_fflush_r+0x70>)
 80035da:	429c      	cmp	r4, r3
 80035dc:	d101      	bne.n	80035e2 <_fflush_r+0x62>
 80035de:	68ac      	ldr	r4, [r5, #8]
 80035e0:	e7df      	b.n	80035a2 <_fflush_r+0x22>
 80035e2:	4b04      	ldr	r3, [pc, #16]	; (80035f4 <_fflush_r+0x74>)
 80035e4:	429c      	cmp	r4, r3
 80035e6:	bf08      	it	eq
 80035e8:	68ec      	ldreq	r4, [r5, #12]
 80035ea:	e7da      	b.n	80035a2 <_fflush_r+0x22>
 80035ec:	08004890 	.word	0x08004890
 80035f0:	080048b0 	.word	0x080048b0
 80035f4:	08004870 	.word	0x08004870

080035f8 <std>:
 80035f8:	2300      	movs	r3, #0
 80035fa:	b510      	push	{r4, lr}
 80035fc:	4604      	mov	r4, r0
 80035fe:	e9c0 3300 	strd	r3, r3, [r0]
 8003602:	e9c0 3304 	strd	r3, r3, [r0, #16]
 8003606:	6083      	str	r3, [r0, #8]
 8003608:	8181      	strh	r1, [r0, #12]
 800360a:	6643      	str	r3, [r0, #100]	; 0x64
 800360c:	81c2      	strh	r2, [r0, #14]
 800360e:	6183      	str	r3, [r0, #24]
 8003610:	4619      	mov	r1, r3
 8003612:	2208      	movs	r2, #8
 8003614:	305c      	adds	r0, #92	; 0x5c
 8003616:	f7fc fe29 	bl	800026c <memset>
 800361a:	4b05      	ldr	r3, [pc, #20]	; (8003630 <std+0x38>)
 800361c:	6224      	str	r4, [r4, #32]
 800361e:	6263      	str	r3, [r4, #36]	; 0x24
 8003620:	4b04      	ldr	r3, [pc, #16]	; (8003634 <std+0x3c>)
 8003622:	62a3      	str	r3, [r4, #40]	; 0x28
 8003624:	4b04      	ldr	r3, [pc, #16]	; (8003638 <std+0x40>)
 8003626:	62e3      	str	r3, [r4, #44]	; 0x2c
 8003628:	4b04      	ldr	r3, [pc, #16]	; (800363c <std+0x44>)
 800362a:	6323      	str	r3, [r4, #48]	; 0x30
 800362c:	bd10      	pop	{r4, pc}
 800362e:	bf00      	nop
 8003630:	08004321 	.word	0x08004321
 8003634:	08004343 	.word	0x08004343
 8003638:	0800437b 	.word	0x0800437b
 800363c:	0800439f 	.word	0x0800439f

08003640 <_cleanup_r>:
 8003640:	4901      	ldr	r1, [pc, #4]	; (8003648 <_cleanup_r+0x8>)
 8003642:	f000 b8af 	b.w	80037a4 <_fwalk_reent>
 8003646:	bf00      	nop
 8003648:	08003581 	.word	0x08003581

0800364c <__sfmoreglue>:
 800364c:	2268      	movs	r2, #104	; 0x68
 800364e:	b570      	push	{r4, r5, r6, lr}
 8003650:	1e4d      	subs	r5, r1, #1
 8003652:	4355      	muls	r5, r2
 8003654:	460e      	mov	r6, r1
 8003656:	f105 0174 	add.w	r1, r5, #116	; 0x74
 800365a:	f000 f993 	bl	8003984 <_malloc_r>
 800365e:	4604      	mov	r4, r0
 8003660:	b140      	cbz	r0, 8003674 <__sfmoreglue+0x28>
 8003662:	2100      	movs	r1, #0
 8003664:	e9c0 1600 	strd	r1, r6, [r0]
 8003668:	300c      	adds	r0, #12
 800366a:	60a0      	str	r0, [r4, #8]
 800366c:	f105 0268 	add.w	r2, r5, #104	; 0x68
 8003670:	f7fc fdfc 	bl	800026c <memset>
 8003674:	4620      	mov	r0, r4
 8003676:	bd70      	pop	{r4, r5, r6, pc}

08003678 <__sfp_lock_acquire>:
 8003678:	4801      	ldr	r0, [pc, #4]	; (8003680 <__sfp_lock_acquire+0x8>)
 800367a:	f000 b8b3 	b.w	80037e4 <__retarget_lock_acquire_recursive>
 800367e:	bf00      	nop
 8003680:	2000de15 	.word	0x2000de15

08003684 <__sfp_lock_release>:
 8003684:	4801      	ldr	r0, [pc, #4]	; (800368c <__sfp_lock_release+0x8>)
 8003686:	f000 b8ae 	b.w	80037e6 <__retarget_lock_release_recursive>
 800368a:	bf00      	nop
 800368c:	2000de15 	.word	0x2000de15

08003690 <__sinit_lock_acquire>:
 8003690:	4801      	ldr	r0, [pc, #4]	; (8003698 <__sinit_lock_acquire+0x8>)
 8003692:	f000 b8a7 	b.w	80037e4 <__retarget_lock_acquire_recursive>
 8003696:	bf00      	nop
 8003698:	2000de16 	.word	0x2000de16

0800369c <__sinit_lock_release>:
 800369c:	4801      	ldr	r0, [pc, #4]	; (80036a4 <__sinit_lock_release+0x8>)
 800369e:	f000 b8a2 	b.w	80037e6 <__retarget_lock_release_recursive>
 80036a2:	bf00      	nop
 80036a4:	2000de16 	.word	0x2000de16

080036a8 <__sinit>:
 80036a8:	b510      	push	{r4, lr}
 80036aa:	4604      	mov	r4, r0
 80036ac:	f7ff fff0 	bl	8003690 <__sinit_lock_acquire>
 80036b0:	69a3      	ldr	r3, [r4, #24]
 80036b2:	b11b      	cbz	r3, 80036bc <__sinit+0x14>
 80036b4:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80036b8:	f7ff bff0 	b.w	800369c <__sinit_lock_release>
 80036bc:	e9c4 3312 	strd	r3, r3, [r4, #72]	; 0x48
 80036c0:	6523      	str	r3, [r4, #80]	; 0x50
 80036c2:	4b13      	ldr	r3, [pc, #76]	; (8003710 <__sinit+0x68>)
 80036c4:	4a13      	ldr	r2, [pc, #76]	; (8003714 <__sinit+0x6c>)
 80036c6:	681b      	ldr	r3, [r3, #0]
 80036c8:	62a2      	str	r2, [r4, #40]	; 0x28
 80036ca:	42a3      	cmp	r3, r4
 80036cc:	bf08      	it	eq
 80036ce:	2301      	moveq	r3, #1
 80036d0:	4620      	mov	r0, r4
 80036d2:	bf08      	it	eq
 80036d4:	61a3      	streq	r3, [r4, #24]
 80036d6:	f000 f81f 	bl	8003718 <__sfp>
 80036da:	6060      	str	r0, [r4, #4]
 80036dc:	4620      	mov	r0, r4
 80036de:	f000 f81b 	bl	8003718 <__sfp>
 80036e2:	60a0      	str	r0, [r4, #8]
 80036e4:	4620      	mov	r0, r4
 80036e6:	f000 f817 	bl	8003718 <__sfp>
 80036ea:	2200      	movs	r2, #0
 80036ec:	2104      	movs	r1, #4
 80036ee:	60e0      	str	r0, [r4, #12]
 80036f0:	6860      	ldr	r0, [r4, #4]
 80036f2:	f7ff ff81 	bl	80035f8 <std>
 80036f6:	2201      	movs	r2, #1
 80036f8:	2109      	movs	r1, #9
 80036fa:	68a0      	ldr	r0, [r4, #8]
 80036fc:	f7ff ff7c 	bl	80035f8 <std>
 8003700:	2202      	movs	r2, #2
 8003702:	2112      	movs	r1, #18
 8003704:	68e0      	ldr	r0, [r4, #12]
 8003706:	f7ff ff77 	bl	80035f8 <std>
 800370a:	2301      	movs	r3, #1
 800370c:	61a3      	str	r3, [r4, #24]
 800370e:	e7d1      	b.n	80036b4 <__sinit+0xc>
 8003710:	08004840 	.word	0x08004840
 8003714:	08003641 	.word	0x08003641

08003718 <__sfp>:
 8003718:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800371a:	4607      	mov	r7, r0
 800371c:	f7ff ffac 	bl	8003678 <__sfp_lock_acquire>
 8003720:	4b1e      	ldr	r3, [pc, #120]	; (800379c <__sfp+0x84>)
 8003722:	681e      	ldr	r6, [r3, #0]
 8003724:	69b3      	ldr	r3, [r6, #24]
 8003726:	b913      	cbnz	r3, 800372e <__sfp+0x16>
 8003728:	4630      	mov	r0, r6
 800372a:	f7ff ffbd 	bl	80036a8 <__sinit>
 800372e:	3648      	adds	r6, #72	; 0x48
 8003730:	e9d6 3401 	ldrd	r3, r4, [r6, #4]
 8003734:	3b01      	subs	r3, #1
 8003736:	d503      	bpl.n	8003740 <__sfp+0x28>
 8003738:	6833      	ldr	r3, [r6, #0]
 800373a:	b30b      	cbz	r3, 8003780 <__sfp+0x68>
 800373c:	6836      	ldr	r6, [r6, #0]
 800373e:	e7f7      	b.n	8003730 <__sfp+0x18>
 8003740:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
 8003744:	b9d5      	cbnz	r5, 800377c <__sfp+0x64>
 8003746:	4b16      	ldr	r3, [pc, #88]	; (80037a0 <__sfp+0x88>)
 8003748:	f104 0058 	add.w	r0, r4, #88	; 0x58
 800374c:	60e3      	str	r3, [r4, #12]
 800374e:	6665      	str	r5, [r4, #100]	; 0x64
 8003750:	f000 f847 	bl	80037e2 <__retarget_lock_init_recursive>
 8003754:	f7ff ff96 	bl	8003684 <__sfp_lock_release>
 8003758:	2208      	movs	r2, #8
 800375a:	4629      	mov	r1, r5
 800375c:	e9c4 5501 	strd	r5, r5, [r4, #4]
 8003760:	e9c4 5504 	strd	r5, r5, [r4, #16]
 8003764:	6025      	str	r5, [r4, #0]
 8003766:	61a5      	str	r5, [r4, #24]
 8003768:	f104 005c 	add.w	r0, r4, #92	; 0x5c
 800376c:	f7fc fd7e 	bl	800026c <memset>
 8003770:	e9c4 550d 	strd	r5, r5, [r4, #52]	; 0x34
 8003774:	e9c4 5512 	strd	r5, r5, [r4, #72]	; 0x48
 8003778:	4620      	mov	r0, r4
 800377a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800377c:	3468      	adds	r4, #104	; 0x68
 800377e:	e7d9      	b.n	8003734 <__sfp+0x1c>
 8003780:	2104      	movs	r1, #4
 8003782:	4638      	mov	r0, r7
 8003784:	f7ff ff62 	bl	800364c <__sfmoreglue>
 8003788:	4604      	mov	r4, r0
 800378a:	6030      	str	r0, [r6, #0]
 800378c:	2800      	cmp	r0, #0
 800378e:	d1d5      	bne.n	800373c <__sfp+0x24>
 8003790:	f7ff ff78 	bl	8003684 <__sfp_lock_release>
 8003794:	230c      	movs	r3, #12
 8003796:	603b      	str	r3, [r7, #0]
 8003798:	e7ee      	b.n	8003778 <__sfp+0x60>
 800379a:	bf00      	nop
 800379c:	08004840 	.word	0x08004840
 80037a0:	ffff0001 	.word	0xffff0001

080037a4 <_fwalk_reent>:
 80037a4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 80037a8:	4606      	mov	r6, r0
 80037aa:	4688      	mov	r8, r1
 80037ac:	2700      	movs	r7, #0
 80037ae:	f100 0448 	add.w	r4, r0, #72	; 0x48
 80037b2:	e9d4 9501 	ldrd	r9, r5, [r4, #4]
 80037b6:	f1b9 0901 	subs.w	r9, r9, #1
 80037ba:	d505      	bpl.n	80037c8 <_fwalk_reent+0x24>
 80037bc:	6824      	ldr	r4, [r4, #0]
 80037be:	2c00      	cmp	r4, #0
 80037c0:	d1f7      	bne.n	80037b2 <_fwalk_reent+0xe>
 80037c2:	4638      	mov	r0, r7
 80037c4:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 80037c8:	89ab      	ldrh	r3, [r5, #12]
 80037ca:	2b01      	cmp	r3, #1
 80037cc:	d907      	bls.n	80037de <_fwalk_reent+0x3a>
 80037ce:	f9b5 300e 	ldrsh.w	r3, [r5, #14]
 80037d2:	3301      	adds	r3, #1
 80037d4:	d003      	beq.n	80037de <_fwalk_reent+0x3a>
 80037d6:	4629      	mov	r1, r5
 80037d8:	4630      	mov	r0, r6
 80037da:	47c0      	blx	r8
 80037dc:	4307      	orrs	r7, r0
 80037de:	3568      	adds	r5, #104	; 0x68
 80037e0:	e7e9      	b.n	80037b6 <_fwalk_reent+0x12>

080037e2 <__retarget_lock_init_recursive>:
 80037e2:	4770      	bx	lr

080037e4 <__retarget_lock_acquire_recursive>:
 80037e4:	4770      	bx	lr

080037e6 <__retarget_lock_release_recursive>:
 80037e6:	4770      	bx	lr

080037e8 <__swhatbuf_r>:
 80037e8:	b570      	push	{r4, r5, r6, lr}
 80037ea:	460e      	mov	r6, r1
 80037ec:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 80037f0:	4614      	mov	r4, r2
 80037f2:	2900      	cmp	r1, #0
 80037f4:	461d      	mov	r5, r3
 80037f6:	b096      	sub	sp, #88	; 0x58
 80037f8:	da08      	bge.n	800380c <__swhatbuf_r+0x24>
 80037fa:	2200      	movs	r2, #0
 80037fc:	f9b6 300c 	ldrsh.w	r3, [r6, #12]
 8003800:	602a      	str	r2, [r5, #0]
 8003802:	061a      	lsls	r2, r3, #24
 8003804:	d410      	bmi.n	8003828 <__swhatbuf_r+0x40>
 8003806:	f44f 6380 	mov.w	r3, #1024	; 0x400
 800380a:	e00e      	b.n	800382a <__swhatbuf_r+0x42>
 800380c:	466a      	mov	r2, sp
 800380e:	f000 fded 	bl	80043ec <_fstat_r>
 8003812:	2800      	cmp	r0, #0
 8003814:	dbf1      	blt.n	80037fa <__swhatbuf_r+0x12>
 8003816:	9a01      	ldr	r2, [sp, #4]
 8003818:	f402 4270 	and.w	r2, r2, #61440	; 0xf000
 800381c:	f5a2 5300 	sub.w	r3, r2, #8192	; 0x2000
 8003820:	425a      	negs	r2, r3
 8003822:	415a      	adcs	r2, r3
 8003824:	602a      	str	r2, [r5, #0]
 8003826:	e7ee      	b.n	8003806 <__swhatbuf_r+0x1e>
 8003828:	2340      	movs	r3, #64	; 0x40
 800382a:	2000      	movs	r0, #0
 800382c:	6023      	str	r3, [r4, #0]
 800382e:	b016      	add	sp, #88	; 0x58
 8003830:	bd70      	pop	{r4, r5, r6, pc}
	...

08003834 <__smakebuf_r>:
 8003834:	898b      	ldrh	r3, [r1, #12]
 8003836:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8003838:	079d      	lsls	r5, r3, #30
 800383a:	4606      	mov	r6, r0
 800383c:	460c      	mov	r4, r1
 800383e:	d507      	bpl.n	8003850 <__smakebuf_r+0x1c>
 8003840:	f104 0347 	add.w	r3, r4, #71	; 0x47
 8003844:	6023      	str	r3, [r4, #0]
 8003846:	6123      	str	r3, [r4, #16]
 8003848:	2301      	movs	r3, #1
 800384a:	6163      	str	r3, [r4, #20]
 800384c:	b002      	add	sp, #8
 800384e:	bd70      	pop	{r4, r5, r6, pc}
 8003850:	466a      	mov	r2, sp
 8003852:	ab01      	add	r3, sp, #4
 8003854:	f7ff ffc8 	bl	80037e8 <__swhatbuf_r>
 8003858:	9900      	ldr	r1, [sp, #0]
 800385a:	4605      	mov	r5, r0
 800385c:	4630      	mov	r0, r6
 800385e:	f000 f891 	bl	8003984 <_malloc_r>
 8003862:	b948      	cbnz	r0, 8003878 <__smakebuf_r+0x44>
 8003864:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
 8003868:	059a      	lsls	r2, r3, #22
 800386a:	d4ef      	bmi.n	800384c <__smakebuf_r+0x18>
 800386c:	f023 0303 	bic.w	r3, r3, #3
 8003870:	f043 0302 	orr.w	r3, r3, #2
 8003874:	81a3      	strh	r3, [r4, #12]
 8003876:	e7e3      	b.n	8003840 <__smakebuf_r+0xc>
 8003878:	4b0d      	ldr	r3, [pc, #52]	; (80038b0 <__smakebuf_r+0x7c>)
 800387a:	62b3      	str	r3, [r6, #40]	; 0x28
 800387c:	89a3      	ldrh	r3, [r4, #12]
 800387e:	6020      	str	r0, [r4, #0]
 8003880:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8003884:	81a3      	strh	r3, [r4, #12]
 8003886:	9b00      	ldr	r3, [sp, #0]
 8003888:	6120      	str	r0, [r4, #16]
 800388a:	6163      	str	r3, [r4, #20]
 800388c:	9b01      	ldr	r3, [sp, #4]
 800388e:	b15b      	cbz	r3, 80038a8 <__smakebuf_r+0x74>
 8003890:	4630      	mov	r0, r6
 8003892:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
 8003896:	f000 fdbb 	bl	8004410 <_isatty_r>
 800389a:	b128      	cbz	r0, 80038a8 <__smakebuf_r+0x74>
 800389c:	89a3      	ldrh	r3, [r4, #12]
 800389e:	f023 0303 	bic.w	r3, r3, #3
 80038a2:	f043 0301 	orr.w	r3, r3, #1
 80038a6:	81a3      	strh	r3, [r4, #12]
 80038a8:	89a0      	ldrh	r0, [r4, #12]
 80038aa:	4305      	orrs	r5, r0
 80038ac:	81a5      	strh	r5, [r4, #12]
 80038ae:	e7cd      	b.n	800384c <__smakebuf_r+0x18>
 80038b0:	08003641 	.word	0x08003641

080038b4 <_free_r>:
 80038b4:	b538      	push	{r3, r4, r5, lr}
 80038b6:	4605      	mov	r5, r0
 80038b8:	2900      	cmp	r1, #0
 80038ba:	d040      	beq.n	800393e <_free_r+0x8a>
 80038bc:	f851 3c04 	ldr.w	r3, [r1, #-4]
 80038c0:	1f0c      	subs	r4, r1, #4
 80038c2:	2b00      	cmp	r3, #0
 80038c4:	bfb8      	it	lt
 80038c6:	18e4      	addlt	r4, r4, r3
 80038c8:	f000 fdec 	bl	80044a4 <__malloc_lock>
 80038cc:	4a1c      	ldr	r2, [pc, #112]	; (8003940 <_free_r+0x8c>)
 80038ce:	6813      	ldr	r3, [r2, #0]
 80038d0:	b933      	cbnz	r3, 80038e0 <_free_r+0x2c>
 80038d2:	6063      	str	r3, [r4, #4]
 80038d4:	6014      	str	r4, [r2, #0]
 80038d6:	4628      	mov	r0, r5
 80038d8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80038dc:	f000 bde8 	b.w	80044b0 <__malloc_unlock>
 80038e0:	42a3      	cmp	r3, r4
 80038e2:	d908      	bls.n	80038f6 <_free_r+0x42>
 80038e4:	6820      	ldr	r0, [r4, #0]
 80038e6:	1821      	adds	r1, r4, r0
 80038e8:	428b      	cmp	r3, r1
 80038ea:	bf01      	itttt	eq
 80038ec:	6819      	ldreq	r1, [r3, #0]
 80038ee:	685b      	ldreq	r3, [r3, #4]
 80038f0:	1809      	addeq	r1, r1, r0
 80038f2:	6021      	streq	r1, [r4, #0]
 80038f4:	e7ed      	b.n	80038d2 <_free_r+0x1e>
 80038f6:	461a      	mov	r2, r3
 80038f8:	685b      	ldr	r3, [r3, #4]
 80038fa:	b10b      	cbz	r3, 8003900 <_free_r+0x4c>
 80038fc:	42a3      	cmp	r3, r4
 80038fe:	d9fa      	bls.n	80038f6 <_free_r+0x42>
 8003900:	6811      	ldr	r1, [r2, #0]
 8003902:	1850      	adds	r0, r2, r1
 8003904:	42a0      	cmp	r0, r4
 8003906:	d10b      	bne.n	8003920 <_free_r+0x6c>
 8003908:	6820      	ldr	r0, [r4, #0]
 800390a:	4401      	add	r1, r0
 800390c:	1850      	adds	r0, r2, r1
 800390e:	4283      	cmp	r3, r0
 8003910:	6011      	str	r1, [r2, #0]
 8003912:	d1e0      	bne.n	80038d6 <_free_r+0x22>
 8003914:	6818      	ldr	r0, [r3, #0]
 8003916:	685b      	ldr	r3, [r3, #4]
 8003918:	4401      	add	r1, r0
 800391a:	6011      	str	r1, [r2, #0]
 800391c:	6053      	str	r3, [r2, #4]
 800391e:	e7da      	b.n	80038d6 <_free_r+0x22>
 8003920:	d902      	bls.n	8003928 <_free_r+0x74>
 8003922:	230c      	movs	r3, #12
 8003924:	602b      	str	r3, [r5, #0]
 8003926:	e7d6      	b.n	80038d6 <_free_r+0x22>
 8003928:	6820      	ldr	r0, [r4, #0]
 800392a:	1821      	adds	r1, r4, r0
 800392c:	428b      	cmp	r3, r1
 800392e:	bf01      	itttt	eq
 8003930:	6819      	ldreq	r1, [r3, #0]
 8003932:	685b      	ldreq	r3, [r3, #4]
 8003934:	1809      	addeq	r1, r1, r0
 8003936:	6021      	streq	r1, [r4, #0]
 8003938:	6063      	str	r3, [r4, #4]
 800393a:	6054      	str	r4, [r2, #4]
 800393c:	e7cb      	b.n	80038d6 <_free_r+0x22>
 800393e:	bd38      	pop	{r3, r4, r5, pc}
 8003940:	2000de18 	.word	0x2000de18

08003944 <sbrk_aligned>:
 8003944:	b570      	push	{r4, r5, r6, lr}
 8003946:	4e0e      	ldr	r6, [pc, #56]	; (8003980 <sbrk_aligned+0x3c>)
 8003948:	460c      	mov	r4, r1
 800394a:	6831      	ldr	r1, [r6, #0]
 800394c:	4605      	mov	r5, r0
 800394e:	b911      	cbnz	r1, 8003956 <sbrk_aligned+0x12>
 8003950:	f000 fcd6 	bl	8004300 <_sbrk_r>
 8003954:	6030      	str	r0, [r6, #0]
 8003956:	4621      	mov	r1, r4
 8003958:	4628      	mov	r0, r5
 800395a:	f000 fcd1 	bl	8004300 <_sbrk_r>
 800395e:	1c43      	adds	r3, r0, #1
 8003960:	d00a      	beq.n	8003978 <sbrk_aligned+0x34>
 8003962:	1cc4      	adds	r4, r0, #3
 8003964:	f024 0403 	bic.w	r4, r4, #3
 8003968:	42a0      	cmp	r0, r4
 800396a:	d007      	beq.n	800397c <sbrk_aligned+0x38>
 800396c:	1a21      	subs	r1, r4, r0
 800396e:	4628      	mov	r0, r5
 8003970:	f000 fcc6 	bl	8004300 <_sbrk_r>
 8003974:	3001      	adds	r0, #1
 8003976:	d101      	bne.n	800397c <sbrk_aligned+0x38>
 8003978:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
 800397c:	4620      	mov	r0, r4
 800397e:	bd70      	pop	{r4, r5, r6, pc}
 8003980:	2000de1c 	.word	0x2000de1c

08003984 <_malloc_r>:
 8003984:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8003988:	1ccd      	adds	r5, r1, #3
 800398a:	f025 0503 	bic.w	r5, r5, #3
 800398e:	3508      	adds	r5, #8
 8003990:	2d0c      	cmp	r5, #12
 8003992:	bf38      	it	cc
 8003994:	250c      	movcc	r5, #12
 8003996:	2d00      	cmp	r5, #0
 8003998:	4607      	mov	r7, r0
 800399a:	db01      	blt.n	80039a0 <_malloc_r+0x1c>
 800399c:	42a9      	cmp	r1, r5
 800399e:	d905      	bls.n	80039ac <_malloc_r+0x28>
 80039a0:	230c      	movs	r3, #12
 80039a2:	2600      	movs	r6, #0
 80039a4:	603b      	str	r3, [r7, #0]
 80039a6:	4630      	mov	r0, r6
 80039a8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80039ac:	4e2e      	ldr	r6, [pc, #184]	; (8003a68 <_malloc_r+0xe4>)
 80039ae:	f000 fd79 	bl	80044a4 <__malloc_lock>
 80039b2:	6833      	ldr	r3, [r6, #0]
 80039b4:	461c      	mov	r4, r3
 80039b6:	bb34      	cbnz	r4, 8003a06 <_malloc_r+0x82>
 80039b8:	4629      	mov	r1, r5
 80039ba:	4638      	mov	r0, r7
 80039bc:	f7ff ffc2 	bl	8003944 <sbrk_aligned>
 80039c0:	1c43      	adds	r3, r0, #1
 80039c2:	4604      	mov	r4, r0
 80039c4:	d14d      	bne.n	8003a62 <_malloc_r+0xde>
 80039c6:	6834      	ldr	r4, [r6, #0]
 80039c8:	4626      	mov	r6, r4
 80039ca:	2e00      	cmp	r6, #0
 80039cc:	d140      	bne.n	8003a50 <_malloc_r+0xcc>
 80039ce:	6823      	ldr	r3, [r4, #0]
 80039d0:	4631      	mov	r1, r6
 80039d2:	4638      	mov	r0, r7
 80039d4:	eb04 0803 	add.w	r8, r4, r3
 80039d8:	f000 fc92 	bl	8004300 <_sbrk_r>
 80039dc:	4580      	cmp	r8, r0
 80039de:	d13a      	bne.n	8003a56 <_malloc_r+0xd2>
 80039e0:	6821      	ldr	r1, [r4, #0]
 80039e2:	3503      	adds	r5, #3
 80039e4:	1a6d      	subs	r5, r5, r1
 80039e6:	f025 0503 	bic.w	r5, r5, #3
 80039ea:	3508      	adds	r5, #8
 80039ec:	2d0c      	cmp	r5, #12
 80039ee:	bf38      	it	cc
 80039f0:	250c      	movcc	r5, #12
 80039f2:	4638      	mov	r0, r7
 80039f4:	4629      	mov	r1, r5
 80039f6:	f7ff ffa5 	bl	8003944 <sbrk_aligned>
 80039fa:	3001      	adds	r0, #1
 80039fc:	d02b      	beq.n	8003a56 <_malloc_r+0xd2>
 80039fe:	6823      	ldr	r3, [r4, #0]
 8003a00:	442b      	add	r3, r5
 8003a02:	6023      	str	r3, [r4, #0]
 8003a04:	e00e      	b.n	8003a24 <_malloc_r+0xa0>
 8003a06:	6822      	ldr	r2, [r4, #0]
 8003a08:	1b52      	subs	r2, r2, r5
 8003a0a:	d41e      	bmi.n	8003a4a <_malloc_r+0xc6>
 8003a0c:	2a0b      	cmp	r2, #11
 8003a0e:	d916      	bls.n	8003a3e <_malloc_r+0xba>
 8003a10:	1961      	adds	r1, r4, r5
 8003a12:	42a3      	cmp	r3, r4
 8003a14:	6025      	str	r5, [r4, #0]
 8003a16:	bf18      	it	ne
 8003a18:	6059      	strne	r1, [r3, #4]
 8003a1a:	6863      	ldr	r3, [r4, #4]
 8003a1c:	bf08      	it	eq
 8003a1e:	6031      	streq	r1, [r6, #0]
 8003a20:	5162      	str	r2, [r4, r5]
 8003a22:	604b      	str	r3, [r1, #4]
 8003a24:	4638      	mov	r0, r7
 8003a26:	f104 060b 	add.w	r6, r4, #11
 8003a2a:	f000 fd41 	bl	80044b0 <__malloc_unlock>
 8003a2e:	f026 0607 	bic.w	r6, r6, #7
 8003a32:	1d23      	adds	r3, r4, #4
 8003a34:	1af2      	subs	r2, r6, r3
 8003a36:	d0b6      	beq.n	80039a6 <_malloc_r+0x22>
 8003a38:	1b9b      	subs	r3, r3, r6
 8003a3a:	50a3      	str	r3, [r4, r2]
 8003a3c:	e7b3      	b.n	80039a6 <_malloc_r+0x22>
 8003a3e:	6862      	ldr	r2, [r4, #4]
 8003a40:	42a3      	cmp	r3, r4
 8003a42:	bf0c      	ite	eq
 8003a44:	6032      	streq	r2, [r6, #0]
 8003a46:	605a      	strne	r2, [r3, #4]
 8003a48:	e7ec      	b.n	8003a24 <_malloc_r+0xa0>
 8003a4a:	4623      	mov	r3, r4
 8003a4c:	6864      	ldr	r4, [r4, #4]
 8003a4e:	e7b2      	b.n	80039b6 <_malloc_r+0x32>
 8003a50:	4634      	mov	r4, r6
 8003a52:	6876      	ldr	r6, [r6, #4]
 8003a54:	e7b9      	b.n	80039ca <_malloc_r+0x46>
 8003a56:	230c      	movs	r3, #12
 8003a58:	4638      	mov	r0, r7
 8003a5a:	603b      	str	r3, [r7, #0]
 8003a5c:	f000 fd28 	bl	80044b0 <__malloc_unlock>
 8003a60:	e7a1      	b.n	80039a6 <_malloc_r+0x22>
 8003a62:	6025      	str	r5, [r4, #0]
 8003a64:	e7de      	b.n	8003a24 <_malloc_r+0xa0>
 8003a66:	bf00      	nop
 8003a68:	2000de18 	.word	0x2000de18

08003a6c <__ssputs_r>:
 8003a6c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8003a70:	688e      	ldr	r6, [r1, #8]
 8003a72:	4682      	mov	sl, r0
 8003a74:	429e      	cmp	r6, r3
 8003a76:	460c      	mov	r4, r1
 8003a78:	4690      	mov	r8, r2
 8003a7a:	461f      	mov	r7, r3
 8003a7c:	d838      	bhi.n	8003af0 <__ssputs_r+0x84>
 8003a7e:	898a      	ldrh	r2, [r1, #12]
 8003a80:	f412 6f90 	tst.w	r2, #1152	; 0x480
 8003a84:	d032      	beq.n	8003aec <__ssputs_r+0x80>
 8003a86:	6825      	ldr	r5, [r4, #0]
 8003a88:	6909      	ldr	r1, [r1, #16]
 8003a8a:	3301      	adds	r3, #1
 8003a8c:	eba5 0901 	sub.w	r9, r5, r1
 8003a90:	6965      	ldr	r5, [r4, #20]
 8003a92:	444b      	add	r3, r9
 8003a94:	eb05 0545 	add.w	r5, r5, r5, lsl #1
 8003a98:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
 8003a9c:	106d      	asrs	r5, r5, #1
 8003a9e:	429d      	cmp	r5, r3
 8003aa0:	bf38      	it	cc
 8003aa2:	461d      	movcc	r5, r3
 8003aa4:	0553      	lsls	r3, r2, #21
 8003aa6:	d531      	bpl.n	8003b0c <__ssputs_r+0xa0>
 8003aa8:	4629      	mov	r1, r5
 8003aaa:	f7ff ff6b 	bl	8003984 <_malloc_r>
 8003aae:	4606      	mov	r6, r0
 8003ab0:	b950      	cbnz	r0, 8003ac8 <__ssputs_r+0x5c>
 8003ab2:	230c      	movs	r3, #12
 8003ab4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8003ab8:	f8ca 3000 	str.w	r3, [sl]
 8003abc:	89a3      	ldrh	r3, [r4, #12]
 8003abe:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 8003ac2:	81a3      	strh	r3, [r4, #12]
 8003ac4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8003ac8:	464a      	mov	r2, r9
 8003aca:	6921      	ldr	r1, [r4, #16]
 8003acc:	f7ff fb46 	bl	800315c <memcpy>
 8003ad0:	89a3      	ldrh	r3, [r4, #12]
 8003ad2:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
 8003ad6:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 8003ada:	81a3      	strh	r3, [r4, #12]
 8003adc:	6126      	str	r6, [r4, #16]
 8003ade:	444e      	add	r6, r9
 8003ae0:	6026      	str	r6, [r4, #0]
 8003ae2:	463e      	mov	r6, r7
 8003ae4:	6165      	str	r5, [r4, #20]
 8003ae6:	eba5 0509 	sub.w	r5, r5, r9
 8003aea:	60a5      	str	r5, [r4, #8]
 8003aec:	42be      	cmp	r6, r7
 8003aee:	d900      	bls.n	8003af2 <__ssputs_r+0x86>
 8003af0:	463e      	mov	r6, r7
 8003af2:	4632      	mov	r2, r6
 8003af4:	4641      	mov	r1, r8
 8003af6:	6820      	ldr	r0, [r4, #0]
 8003af8:	f000 fcba 	bl	8004470 <memmove>
 8003afc:	68a3      	ldr	r3, [r4, #8]
 8003afe:	2000      	movs	r0, #0
 8003b00:	1b9b      	subs	r3, r3, r6
 8003b02:	60a3      	str	r3, [r4, #8]
 8003b04:	6823      	ldr	r3, [r4, #0]
 8003b06:	4433      	add	r3, r6
 8003b08:	6023      	str	r3, [r4, #0]
 8003b0a:	e7db      	b.n	8003ac4 <__ssputs_r+0x58>
 8003b0c:	462a      	mov	r2, r5
 8003b0e:	f000 fcd5 	bl	80044bc <_realloc_r>
 8003b12:	4606      	mov	r6, r0
 8003b14:	2800      	cmp	r0, #0
 8003b16:	d1e1      	bne.n	8003adc <__ssputs_r+0x70>
 8003b18:	4650      	mov	r0, sl
 8003b1a:	6921      	ldr	r1, [r4, #16]
 8003b1c:	f7ff feca 	bl	80038b4 <_free_r>
 8003b20:	e7c7      	b.n	8003ab2 <__ssputs_r+0x46>
	...

08003b24 <_svfiprintf_r>:
 8003b24:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8003b28:	4698      	mov	r8, r3
 8003b2a:	898b      	ldrh	r3, [r1, #12]
 8003b2c:	4607      	mov	r7, r0
 8003b2e:	061b      	lsls	r3, r3, #24
 8003b30:	460d      	mov	r5, r1
 8003b32:	4614      	mov	r4, r2
 8003b34:	b09d      	sub	sp, #116	; 0x74
 8003b36:	d50e      	bpl.n	8003b56 <_svfiprintf_r+0x32>
 8003b38:	690b      	ldr	r3, [r1, #16]
 8003b3a:	b963      	cbnz	r3, 8003b56 <_svfiprintf_r+0x32>
 8003b3c:	2140      	movs	r1, #64	; 0x40
 8003b3e:	f7ff ff21 	bl	8003984 <_malloc_r>
 8003b42:	6028      	str	r0, [r5, #0]
 8003b44:	6128      	str	r0, [r5, #16]
 8003b46:	b920      	cbnz	r0, 8003b52 <_svfiprintf_r+0x2e>
 8003b48:	230c      	movs	r3, #12
 8003b4a:	603b      	str	r3, [r7, #0]
 8003b4c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8003b50:	e0d1      	b.n	8003cf6 <_svfiprintf_r+0x1d2>
 8003b52:	2340      	movs	r3, #64	; 0x40
 8003b54:	616b      	str	r3, [r5, #20]
 8003b56:	2300      	movs	r3, #0
 8003b58:	9309      	str	r3, [sp, #36]	; 0x24
 8003b5a:	2320      	movs	r3, #32
 8003b5c:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
 8003b60:	2330      	movs	r3, #48	; 0x30
 8003b62:	f04f 0901 	mov.w	r9, #1
 8003b66:	f8cd 800c 	str.w	r8, [sp, #12]
 8003b6a:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 8003d10 <_svfiprintf_r+0x1ec>
 8003b6e:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
 8003b72:	4623      	mov	r3, r4
 8003b74:	469a      	mov	sl, r3
 8003b76:	f813 2b01 	ldrb.w	r2, [r3], #1
 8003b7a:	b10a      	cbz	r2, 8003b80 <_svfiprintf_r+0x5c>
 8003b7c:	2a25      	cmp	r2, #37	; 0x25
 8003b7e:	d1f9      	bne.n	8003b74 <_svfiprintf_r+0x50>
 8003b80:	ebba 0b04 	subs.w	fp, sl, r4
 8003b84:	d00b      	beq.n	8003b9e <_svfiprintf_r+0x7a>
 8003b86:	465b      	mov	r3, fp
 8003b88:	4622      	mov	r2, r4
 8003b8a:	4629      	mov	r1, r5
 8003b8c:	4638      	mov	r0, r7
 8003b8e:	f7ff ff6d 	bl	8003a6c <__ssputs_r>
 8003b92:	3001      	adds	r0, #1
 8003b94:	f000 80aa 	beq.w	8003cec <_svfiprintf_r+0x1c8>
 8003b98:	9a09      	ldr	r2, [sp, #36]	; 0x24
 8003b9a:	445a      	add	r2, fp
 8003b9c:	9209      	str	r2, [sp, #36]	; 0x24
 8003b9e:	f89a 3000 	ldrb.w	r3, [sl]
 8003ba2:	2b00      	cmp	r3, #0
 8003ba4:	f000 80a2 	beq.w	8003cec <_svfiprintf_r+0x1c8>
 8003ba8:	2300      	movs	r3, #0
 8003baa:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8003bae:	e9cd 2305 	strd	r2, r3, [sp, #20]
 8003bb2:	f10a 0a01 	add.w	sl, sl, #1
 8003bb6:	9304      	str	r3, [sp, #16]
 8003bb8:	9307      	str	r3, [sp, #28]
 8003bba:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
 8003bbe:	931a      	str	r3, [sp, #104]	; 0x68
 8003bc0:	4654      	mov	r4, sl
 8003bc2:	2205      	movs	r2, #5
 8003bc4:	f814 1b01 	ldrb.w	r1, [r4], #1
 8003bc8:	4851      	ldr	r0, [pc, #324]	; (8003d10 <_svfiprintf_r+0x1ec>)
 8003bca:	f000 fc43 	bl	8004454 <memchr>
 8003bce:	9a04      	ldr	r2, [sp, #16]
 8003bd0:	b9d8      	cbnz	r0, 8003c0a <_svfiprintf_r+0xe6>
 8003bd2:	06d0      	lsls	r0, r2, #27
 8003bd4:	bf44      	itt	mi
 8003bd6:	2320      	movmi	r3, #32
 8003bd8:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8003bdc:	0711      	lsls	r1, r2, #28
 8003bde:	bf44      	itt	mi
 8003be0:	232b      	movmi	r3, #43	; 0x2b
 8003be2:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8003be6:	f89a 3000 	ldrb.w	r3, [sl]
 8003bea:	2b2a      	cmp	r3, #42	; 0x2a
 8003bec:	d015      	beq.n	8003c1a <_svfiprintf_r+0xf6>
 8003bee:	4654      	mov	r4, sl
 8003bf0:	2000      	movs	r0, #0
 8003bf2:	f04f 0c0a 	mov.w	ip, #10
 8003bf6:	9a07      	ldr	r2, [sp, #28]
 8003bf8:	4621      	mov	r1, r4
 8003bfa:	f811 3b01 	ldrb.w	r3, [r1], #1
 8003bfe:	3b30      	subs	r3, #48	; 0x30
 8003c00:	2b09      	cmp	r3, #9
 8003c02:	d94e      	bls.n	8003ca2 <_svfiprintf_r+0x17e>
 8003c04:	b1b0      	cbz	r0, 8003c34 <_svfiprintf_r+0x110>
 8003c06:	9207      	str	r2, [sp, #28]
 8003c08:	e014      	b.n	8003c34 <_svfiprintf_r+0x110>
 8003c0a:	eba0 0308 	sub.w	r3, r0, r8
 8003c0e:	fa09 f303 	lsl.w	r3, r9, r3
 8003c12:	4313      	orrs	r3, r2
 8003c14:	46a2      	mov	sl, r4
 8003c16:	9304      	str	r3, [sp, #16]
 8003c18:	e7d2      	b.n	8003bc0 <_svfiprintf_r+0x9c>
 8003c1a:	9b03      	ldr	r3, [sp, #12]
 8003c1c:	1d19      	adds	r1, r3, #4
 8003c1e:	681b      	ldr	r3, [r3, #0]
 8003c20:	9103      	str	r1, [sp, #12]
 8003c22:	2b00      	cmp	r3, #0
 8003c24:	bfbb      	ittet	lt
 8003c26:	425b      	neglt	r3, r3
 8003c28:	f042 0202 	orrlt.w	r2, r2, #2
 8003c2c:	9307      	strge	r3, [sp, #28]
 8003c2e:	9307      	strlt	r3, [sp, #28]
 8003c30:	bfb8      	it	lt
 8003c32:	9204      	strlt	r2, [sp, #16]
 8003c34:	7823      	ldrb	r3, [r4, #0]
 8003c36:	2b2e      	cmp	r3, #46	; 0x2e
 8003c38:	d10c      	bne.n	8003c54 <_svfiprintf_r+0x130>
 8003c3a:	7863      	ldrb	r3, [r4, #1]
 8003c3c:	2b2a      	cmp	r3, #42	; 0x2a
 8003c3e:	d135      	bne.n	8003cac <_svfiprintf_r+0x188>
 8003c40:	9b03      	ldr	r3, [sp, #12]
 8003c42:	3402      	adds	r4, #2
 8003c44:	1d1a      	adds	r2, r3, #4
 8003c46:	681b      	ldr	r3, [r3, #0]
 8003c48:	9203      	str	r2, [sp, #12]
 8003c4a:	2b00      	cmp	r3, #0
 8003c4c:	bfb8      	it	lt
 8003c4e:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
 8003c52:	9305      	str	r3, [sp, #20]
 8003c54:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 8003d14 <_svfiprintf_r+0x1f0>
 8003c58:	2203      	movs	r2, #3
 8003c5a:	4650      	mov	r0, sl
 8003c5c:	7821      	ldrb	r1, [r4, #0]
 8003c5e:	f000 fbf9 	bl	8004454 <memchr>
 8003c62:	b140      	cbz	r0, 8003c76 <_svfiprintf_r+0x152>
 8003c64:	2340      	movs	r3, #64	; 0x40
 8003c66:	eba0 000a 	sub.w	r0, r0, sl
 8003c6a:	fa03 f000 	lsl.w	r0, r3, r0
 8003c6e:	9b04      	ldr	r3, [sp, #16]
 8003c70:	3401      	adds	r4, #1
 8003c72:	4303      	orrs	r3, r0
 8003c74:	9304      	str	r3, [sp, #16]
 8003c76:	f814 1b01 	ldrb.w	r1, [r4], #1
 8003c7a:	2206      	movs	r2, #6
 8003c7c:	4826      	ldr	r0, [pc, #152]	; (8003d18 <_svfiprintf_r+0x1f4>)
 8003c7e:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
 8003c82:	f000 fbe7 	bl	8004454 <memchr>
 8003c86:	2800      	cmp	r0, #0
 8003c88:	d038      	beq.n	8003cfc <_svfiprintf_r+0x1d8>
 8003c8a:	4b24      	ldr	r3, [pc, #144]	; (8003d1c <_svfiprintf_r+0x1f8>)
 8003c8c:	bb1b      	cbnz	r3, 8003cd6 <_svfiprintf_r+0x1b2>
 8003c8e:	9b03      	ldr	r3, [sp, #12]
 8003c90:	3307      	adds	r3, #7
 8003c92:	f023 0307 	bic.w	r3, r3, #7
 8003c96:	3308      	adds	r3, #8
 8003c98:	9303      	str	r3, [sp, #12]
 8003c9a:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8003c9c:	4433      	add	r3, r6
 8003c9e:	9309      	str	r3, [sp, #36]	; 0x24
 8003ca0:	e767      	b.n	8003b72 <_svfiprintf_r+0x4e>
 8003ca2:	460c      	mov	r4, r1
 8003ca4:	2001      	movs	r0, #1
 8003ca6:	fb0c 3202 	mla	r2, ip, r2, r3
 8003caa:	e7a5      	b.n	8003bf8 <_svfiprintf_r+0xd4>
 8003cac:	2300      	movs	r3, #0
 8003cae:	f04f 0c0a 	mov.w	ip, #10
 8003cb2:	4619      	mov	r1, r3
 8003cb4:	3401      	adds	r4, #1
 8003cb6:	9305      	str	r3, [sp, #20]
 8003cb8:	4620      	mov	r0, r4
 8003cba:	f810 2b01 	ldrb.w	r2, [r0], #1
 8003cbe:	3a30      	subs	r2, #48	; 0x30
 8003cc0:	2a09      	cmp	r2, #9
 8003cc2:	d903      	bls.n	8003ccc <_svfiprintf_r+0x1a8>
 8003cc4:	2b00      	cmp	r3, #0
 8003cc6:	d0c5      	beq.n	8003c54 <_svfiprintf_r+0x130>
 8003cc8:	9105      	str	r1, [sp, #20]
 8003cca:	e7c3      	b.n	8003c54 <_svfiprintf_r+0x130>
 8003ccc:	4604      	mov	r4, r0
 8003cce:	2301      	movs	r3, #1
 8003cd0:	fb0c 2101 	mla	r1, ip, r1, r2
 8003cd4:	e7f0      	b.n	8003cb8 <_svfiprintf_r+0x194>
 8003cd6:	ab03      	add	r3, sp, #12
 8003cd8:	9300      	str	r3, [sp, #0]
 8003cda:	462a      	mov	r2, r5
 8003cdc:	4638      	mov	r0, r7
 8003cde:	4b10      	ldr	r3, [pc, #64]	; (8003d20 <_svfiprintf_r+0x1fc>)
 8003ce0:	a904      	add	r1, sp, #16
 8003ce2:	f3af 8000 	nop.w
 8003ce6:	1c42      	adds	r2, r0, #1
 8003ce8:	4606      	mov	r6, r0
 8003cea:	d1d6      	bne.n	8003c9a <_svfiprintf_r+0x176>
 8003cec:	89ab      	ldrh	r3, [r5, #12]
 8003cee:	065b      	lsls	r3, r3, #25
 8003cf0:	f53f af2c 	bmi.w	8003b4c <_svfiprintf_r+0x28>
 8003cf4:	9809      	ldr	r0, [sp, #36]	; 0x24
 8003cf6:	b01d      	add	sp, #116	; 0x74
 8003cf8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8003cfc:	ab03      	add	r3, sp, #12
 8003cfe:	9300      	str	r3, [sp, #0]
 8003d00:	462a      	mov	r2, r5
 8003d02:	4638      	mov	r0, r7
 8003d04:	4b06      	ldr	r3, [pc, #24]	; (8003d20 <_svfiprintf_r+0x1fc>)
 8003d06:	a904      	add	r1, sp, #16
 8003d08:	f000 f9d4 	bl	80040b4 <_printf_i>
 8003d0c:	e7eb      	b.n	8003ce6 <_svfiprintf_r+0x1c2>
 8003d0e:	bf00      	nop
 8003d10:	080048d0 	.word	0x080048d0
 8003d14:	080048d6 	.word	0x080048d6
 8003d18:	080048da 	.word	0x080048da
 8003d1c:	00000000 	.word	0x00000000
 8003d20:	08003a6d 	.word	0x08003a6d

08003d24 <__sfputc_r>:
 8003d24:	6893      	ldr	r3, [r2, #8]
 8003d26:	b410      	push	{r4}
 8003d28:	3b01      	subs	r3, #1
 8003d2a:	2b00      	cmp	r3, #0
 8003d2c:	6093      	str	r3, [r2, #8]
 8003d2e:	da07      	bge.n	8003d40 <__sfputc_r+0x1c>
 8003d30:	6994      	ldr	r4, [r2, #24]
 8003d32:	42a3      	cmp	r3, r4
 8003d34:	db01      	blt.n	8003d3a <__sfputc_r+0x16>
 8003d36:	290a      	cmp	r1, #10
 8003d38:	d102      	bne.n	8003d40 <__sfputc_r+0x1c>
 8003d3a:	bc10      	pop	{r4}
 8003d3c:	f7ff bade 	b.w	80032fc <__swbuf_r>
 8003d40:	6813      	ldr	r3, [r2, #0]
 8003d42:	1c58      	adds	r0, r3, #1
 8003d44:	6010      	str	r0, [r2, #0]
 8003d46:	7019      	strb	r1, [r3, #0]
 8003d48:	4608      	mov	r0, r1
 8003d4a:	bc10      	pop	{r4}
 8003d4c:	4770      	bx	lr

08003d4e <__sfputs_r>:
 8003d4e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8003d50:	4606      	mov	r6, r0
 8003d52:	460f      	mov	r7, r1
 8003d54:	4614      	mov	r4, r2
 8003d56:	18d5      	adds	r5, r2, r3
 8003d58:	42ac      	cmp	r4, r5
 8003d5a:	d101      	bne.n	8003d60 <__sfputs_r+0x12>
 8003d5c:	2000      	movs	r0, #0
 8003d5e:	e007      	b.n	8003d70 <__sfputs_r+0x22>
 8003d60:	463a      	mov	r2, r7
 8003d62:	4630      	mov	r0, r6
 8003d64:	f814 1b01 	ldrb.w	r1, [r4], #1
 8003d68:	f7ff ffdc 	bl	8003d24 <__sfputc_r>
 8003d6c:	1c43      	adds	r3, r0, #1
 8003d6e:	d1f3      	bne.n	8003d58 <__sfputs_r+0xa>
 8003d70:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

08003d74 <_vfiprintf_r>:
 8003d74:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8003d78:	460d      	mov	r5, r1
 8003d7a:	4614      	mov	r4, r2
 8003d7c:	4698      	mov	r8, r3
 8003d7e:	4606      	mov	r6, r0
 8003d80:	b09d      	sub	sp, #116	; 0x74
 8003d82:	b118      	cbz	r0, 8003d8c <_vfiprintf_r+0x18>
 8003d84:	6983      	ldr	r3, [r0, #24]
 8003d86:	b90b      	cbnz	r3, 8003d8c <_vfiprintf_r+0x18>
 8003d88:	f7ff fc8e 	bl	80036a8 <__sinit>
 8003d8c:	4b89      	ldr	r3, [pc, #548]	; (8003fb4 <_vfiprintf_r+0x240>)
 8003d8e:	429d      	cmp	r5, r3
 8003d90:	d11b      	bne.n	8003dca <_vfiprintf_r+0x56>
 8003d92:	6875      	ldr	r5, [r6, #4]
 8003d94:	6e6b      	ldr	r3, [r5, #100]	; 0x64
 8003d96:	07d9      	lsls	r1, r3, #31
 8003d98:	d405      	bmi.n	8003da6 <_vfiprintf_r+0x32>
 8003d9a:	89ab      	ldrh	r3, [r5, #12]
 8003d9c:	059a      	lsls	r2, r3, #22
 8003d9e:	d402      	bmi.n	8003da6 <_vfiprintf_r+0x32>
 8003da0:	6da8      	ldr	r0, [r5, #88]	; 0x58
 8003da2:	f7ff fd1f 	bl	80037e4 <__retarget_lock_acquire_recursive>
 8003da6:	89ab      	ldrh	r3, [r5, #12]
 8003da8:	071b      	lsls	r3, r3, #28
 8003daa:	d501      	bpl.n	8003db0 <_vfiprintf_r+0x3c>
 8003dac:	692b      	ldr	r3, [r5, #16]
 8003dae:	b9eb      	cbnz	r3, 8003dec <_vfiprintf_r+0x78>
 8003db0:	4629      	mov	r1, r5
 8003db2:	4630      	mov	r0, r6
 8003db4:	f7ff faf4 	bl	80033a0 <__swsetup_r>
 8003db8:	b1c0      	cbz	r0, 8003dec <_vfiprintf_r+0x78>
 8003dba:	6e6b      	ldr	r3, [r5, #100]	; 0x64
 8003dbc:	07dc      	lsls	r4, r3, #31
 8003dbe:	d50e      	bpl.n	8003dde <_vfiprintf_r+0x6a>
 8003dc0:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8003dc4:	b01d      	add	sp, #116	; 0x74
 8003dc6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8003dca:	4b7b      	ldr	r3, [pc, #492]	; (8003fb8 <_vfiprintf_r+0x244>)
 8003dcc:	429d      	cmp	r5, r3
 8003dce:	d101      	bne.n	8003dd4 <_vfiprintf_r+0x60>
 8003dd0:	68b5      	ldr	r5, [r6, #8]
 8003dd2:	e7df      	b.n	8003d94 <_vfiprintf_r+0x20>
 8003dd4:	4b79      	ldr	r3, [pc, #484]	; (8003fbc <_vfiprintf_r+0x248>)
 8003dd6:	429d      	cmp	r5, r3
 8003dd8:	bf08      	it	eq
 8003dda:	68f5      	ldreq	r5, [r6, #12]
 8003ddc:	e7da      	b.n	8003d94 <_vfiprintf_r+0x20>
 8003dde:	89ab      	ldrh	r3, [r5, #12]
 8003de0:	0598      	lsls	r0, r3, #22
 8003de2:	d4ed      	bmi.n	8003dc0 <_vfiprintf_r+0x4c>
 8003de4:	6da8      	ldr	r0, [r5, #88]	; 0x58
 8003de6:	f7ff fcfe 	bl	80037e6 <__retarget_lock_release_recursive>
 8003dea:	e7e9      	b.n	8003dc0 <_vfiprintf_r+0x4c>
 8003dec:	2300      	movs	r3, #0
 8003dee:	9309      	str	r3, [sp, #36]	; 0x24
 8003df0:	2320      	movs	r3, #32
 8003df2:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
 8003df6:	2330      	movs	r3, #48	; 0x30
 8003df8:	f04f 0901 	mov.w	r9, #1
 8003dfc:	f8cd 800c 	str.w	r8, [sp, #12]
 8003e00:	f8df 81bc 	ldr.w	r8, [pc, #444]	; 8003fc0 <_vfiprintf_r+0x24c>
 8003e04:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
 8003e08:	4623      	mov	r3, r4
 8003e0a:	469a      	mov	sl, r3
 8003e0c:	f813 2b01 	ldrb.w	r2, [r3], #1
 8003e10:	b10a      	cbz	r2, 8003e16 <_vfiprintf_r+0xa2>
 8003e12:	2a25      	cmp	r2, #37	; 0x25
 8003e14:	d1f9      	bne.n	8003e0a <_vfiprintf_r+0x96>
 8003e16:	ebba 0b04 	subs.w	fp, sl, r4
 8003e1a:	d00b      	beq.n	8003e34 <_vfiprintf_r+0xc0>
 8003e1c:	465b      	mov	r3, fp
 8003e1e:	4622      	mov	r2, r4
 8003e20:	4629      	mov	r1, r5
 8003e22:	4630      	mov	r0, r6
 8003e24:	f7ff ff93 	bl	8003d4e <__sfputs_r>
 8003e28:	3001      	adds	r0, #1
 8003e2a:	f000 80aa 	beq.w	8003f82 <_vfiprintf_r+0x20e>
 8003e2e:	9a09      	ldr	r2, [sp, #36]	; 0x24
 8003e30:	445a      	add	r2, fp
 8003e32:	9209      	str	r2, [sp, #36]	; 0x24
 8003e34:	f89a 3000 	ldrb.w	r3, [sl]
 8003e38:	2b00      	cmp	r3, #0
 8003e3a:	f000 80a2 	beq.w	8003f82 <_vfiprintf_r+0x20e>
 8003e3e:	2300      	movs	r3, #0
 8003e40:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8003e44:	e9cd 2305 	strd	r2, r3, [sp, #20]
 8003e48:	f10a 0a01 	add.w	sl, sl, #1
 8003e4c:	9304      	str	r3, [sp, #16]
 8003e4e:	9307      	str	r3, [sp, #28]
 8003e50:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
 8003e54:	931a      	str	r3, [sp, #104]	; 0x68
 8003e56:	4654      	mov	r4, sl
 8003e58:	2205      	movs	r2, #5
 8003e5a:	f814 1b01 	ldrb.w	r1, [r4], #1
 8003e5e:	4858      	ldr	r0, [pc, #352]	; (8003fc0 <_vfiprintf_r+0x24c>)
 8003e60:	f000 faf8 	bl	8004454 <memchr>
 8003e64:	9a04      	ldr	r2, [sp, #16]
 8003e66:	b9d8      	cbnz	r0, 8003ea0 <_vfiprintf_r+0x12c>
 8003e68:	06d1      	lsls	r1, r2, #27
 8003e6a:	bf44      	itt	mi
 8003e6c:	2320      	movmi	r3, #32
 8003e6e:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8003e72:	0713      	lsls	r3, r2, #28
 8003e74:	bf44      	itt	mi
 8003e76:	232b      	movmi	r3, #43	; 0x2b
 8003e78:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
 8003e7c:	f89a 3000 	ldrb.w	r3, [sl]
 8003e80:	2b2a      	cmp	r3, #42	; 0x2a
 8003e82:	d015      	beq.n	8003eb0 <_vfiprintf_r+0x13c>
 8003e84:	4654      	mov	r4, sl
 8003e86:	2000      	movs	r0, #0
 8003e88:	f04f 0c0a 	mov.w	ip, #10
 8003e8c:	9a07      	ldr	r2, [sp, #28]
 8003e8e:	4621      	mov	r1, r4
 8003e90:	f811 3b01 	ldrb.w	r3, [r1], #1
 8003e94:	3b30      	subs	r3, #48	; 0x30
 8003e96:	2b09      	cmp	r3, #9
 8003e98:	d94e      	bls.n	8003f38 <_vfiprintf_r+0x1c4>
 8003e9a:	b1b0      	cbz	r0, 8003eca <_vfiprintf_r+0x156>
 8003e9c:	9207      	str	r2, [sp, #28]
 8003e9e:	e014      	b.n	8003eca <_vfiprintf_r+0x156>
 8003ea0:	eba0 0308 	sub.w	r3, r0, r8
 8003ea4:	fa09 f303 	lsl.w	r3, r9, r3
 8003ea8:	4313      	orrs	r3, r2
 8003eaa:	46a2      	mov	sl, r4
 8003eac:	9304      	str	r3, [sp, #16]
 8003eae:	e7d2      	b.n	8003e56 <_vfiprintf_r+0xe2>
 8003eb0:	9b03      	ldr	r3, [sp, #12]
 8003eb2:	1d19      	adds	r1, r3, #4
 8003eb4:	681b      	ldr	r3, [r3, #0]
 8003eb6:	9103      	str	r1, [sp, #12]
 8003eb8:	2b00      	cmp	r3, #0
 8003eba:	bfbb      	ittet	lt
 8003ebc:	425b      	neglt	r3, r3
 8003ebe:	f042 0202 	orrlt.w	r2, r2, #2
 8003ec2:	9307      	strge	r3, [sp, #28]
 8003ec4:	9307      	strlt	r3, [sp, #28]
 8003ec6:	bfb8      	it	lt
 8003ec8:	9204      	strlt	r2, [sp, #16]
 8003eca:	7823      	ldrb	r3, [r4, #0]
 8003ecc:	2b2e      	cmp	r3, #46	; 0x2e
 8003ece:	d10c      	bne.n	8003eea <_vfiprintf_r+0x176>
 8003ed0:	7863      	ldrb	r3, [r4, #1]
 8003ed2:	2b2a      	cmp	r3, #42	; 0x2a
 8003ed4:	d135      	bne.n	8003f42 <_vfiprintf_r+0x1ce>
 8003ed6:	9b03      	ldr	r3, [sp, #12]
 8003ed8:	3402      	adds	r4, #2
 8003eda:	1d1a      	adds	r2, r3, #4
 8003edc:	681b      	ldr	r3, [r3, #0]
 8003ede:	9203      	str	r2, [sp, #12]
 8003ee0:	2b00      	cmp	r3, #0
 8003ee2:	bfb8      	it	lt
 8003ee4:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
 8003ee8:	9305      	str	r3, [sp, #20]
 8003eea:	f8df a0d8 	ldr.w	sl, [pc, #216]	; 8003fc4 <_vfiprintf_r+0x250>
 8003eee:	2203      	movs	r2, #3
 8003ef0:	4650      	mov	r0, sl
 8003ef2:	7821      	ldrb	r1, [r4, #0]
 8003ef4:	f000 faae 	bl	8004454 <memchr>
 8003ef8:	b140      	cbz	r0, 8003f0c <_vfiprintf_r+0x198>
 8003efa:	2340      	movs	r3, #64	; 0x40
 8003efc:	eba0 000a 	sub.w	r0, r0, sl
 8003f00:	fa03 f000 	lsl.w	r0, r3, r0
 8003f04:	9b04      	ldr	r3, [sp, #16]
 8003f06:	3401      	adds	r4, #1
 8003f08:	4303      	orrs	r3, r0
 8003f0a:	9304      	str	r3, [sp, #16]
 8003f0c:	f814 1b01 	ldrb.w	r1, [r4], #1
 8003f10:	2206      	movs	r2, #6
 8003f12:	482d      	ldr	r0, [pc, #180]	; (8003fc8 <_vfiprintf_r+0x254>)
 8003f14:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
 8003f18:	f000 fa9c 	bl	8004454 <memchr>
 8003f1c:	2800      	cmp	r0, #0
 8003f1e:	d03f      	beq.n	8003fa0 <_vfiprintf_r+0x22c>
 8003f20:	4b2a      	ldr	r3, [pc, #168]	; (8003fcc <_vfiprintf_r+0x258>)
 8003f22:	bb1b      	cbnz	r3, 8003f6c <_vfiprintf_r+0x1f8>
 8003f24:	9b03      	ldr	r3, [sp, #12]
 8003f26:	3307      	adds	r3, #7
 8003f28:	f023 0307 	bic.w	r3, r3, #7
 8003f2c:	3308      	adds	r3, #8
 8003f2e:	9303      	str	r3, [sp, #12]
 8003f30:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8003f32:	443b      	add	r3, r7
 8003f34:	9309      	str	r3, [sp, #36]	; 0x24
 8003f36:	e767      	b.n	8003e08 <_vfiprintf_r+0x94>
 8003f38:	460c      	mov	r4, r1
 8003f3a:	2001      	movs	r0, #1
 8003f3c:	fb0c 3202 	mla	r2, ip, r2, r3
 8003f40:	e7a5      	b.n	8003e8e <_vfiprintf_r+0x11a>
 8003f42:	2300      	movs	r3, #0
 8003f44:	f04f 0c0a 	mov.w	ip, #10
 8003f48:	4619      	mov	r1, r3
 8003f4a:	3401      	adds	r4, #1
 8003f4c:	9305      	str	r3, [sp, #20]
 8003f4e:	4620      	mov	r0, r4
 8003f50:	f810 2b01 	ldrb.w	r2, [r0], #1
 8003f54:	3a30      	subs	r2, #48	; 0x30
 8003f56:	2a09      	cmp	r2, #9
 8003f58:	d903      	bls.n	8003f62 <_vfiprintf_r+0x1ee>
 8003f5a:	2b00      	cmp	r3, #0
 8003f5c:	d0c5      	beq.n	8003eea <_vfiprintf_r+0x176>
 8003f5e:	9105      	str	r1, [sp, #20]
 8003f60:	e7c3      	b.n	8003eea <_vfiprintf_r+0x176>
 8003f62:	4604      	mov	r4, r0
 8003f64:	2301      	movs	r3, #1
 8003f66:	fb0c 2101 	mla	r1, ip, r1, r2
 8003f6a:	e7f0      	b.n	8003f4e <_vfiprintf_r+0x1da>
 8003f6c:	ab03      	add	r3, sp, #12
 8003f6e:	9300      	str	r3, [sp, #0]
 8003f70:	462a      	mov	r2, r5
 8003f72:	4630      	mov	r0, r6
 8003f74:	4b16      	ldr	r3, [pc, #88]	; (8003fd0 <_vfiprintf_r+0x25c>)
 8003f76:	a904      	add	r1, sp, #16
 8003f78:	f3af 8000 	nop.w
 8003f7c:	4607      	mov	r7, r0
 8003f7e:	1c78      	adds	r0, r7, #1
 8003f80:	d1d6      	bne.n	8003f30 <_vfiprintf_r+0x1bc>
 8003f82:	6e6b      	ldr	r3, [r5, #100]	; 0x64
 8003f84:	07d9      	lsls	r1, r3, #31
 8003f86:	d405      	bmi.n	8003f94 <_vfiprintf_r+0x220>
 8003f88:	89ab      	ldrh	r3, [r5, #12]
 8003f8a:	059a      	lsls	r2, r3, #22
 8003f8c:	d402      	bmi.n	8003f94 <_vfiprintf_r+0x220>
 8003f8e:	6da8      	ldr	r0, [r5, #88]	; 0x58
 8003f90:	f7ff fc29 	bl	80037e6 <__retarget_lock_release_recursive>
 8003f94:	89ab      	ldrh	r3, [r5, #12]
 8003f96:	065b      	lsls	r3, r3, #25
 8003f98:	f53f af12 	bmi.w	8003dc0 <_vfiprintf_r+0x4c>
 8003f9c:	9809      	ldr	r0, [sp, #36]	; 0x24
 8003f9e:	e711      	b.n	8003dc4 <_vfiprintf_r+0x50>
 8003fa0:	ab03      	add	r3, sp, #12
 8003fa2:	9300      	str	r3, [sp, #0]
 8003fa4:	462a      	mov	r2, r5
 8003fa6:	4630      	mov	r0, r6
 8003fa8:	4b09      	ldr	r3, [pc, #36]	; (8003fd0 <_vfiprintf_r+0x25c>)
 8003faa:	a904      	add	r1, sp, #16
 8003fac:	f000 f882 	bl	80040b4 <_printf_i>
 8003fb0:	e7e4      	b.n	8003f7c <_vfiprintf_r+0x208>
 8003fb2:	bf00      	nop
 8003fb4:	08004890 	.word	0x08004890
 8003fb8:	080048b0 	.word	0x080048b0
 8003fbc:	08004870 	.word	0x08004870
 8003fc0:	080048d0 	.word	0x080048d0
 8003fc4:	080048d6 	.word	0x080048d6
 8003fc8:	080048da 	.word	0x080048da
 8003fcc:	00000000 	.word	0x00000000
 8003fd0:	08003d4f 	.word	0x08003d4f

08003fd4 <_printf_common>:
 8003fd4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8003fd8:	4616      	mov	r6, r2
 8003fda:	4699      	mov	r9, r3
 8003fdc:	688a      	ldr	r2, [r1, #8]
 8003fde:	690b      	ldr	r3, [r1, #16]
 8003fe0:	4607      	mov	r7, r0
 8003fe2:	4293      	cmp	r3, r2
 8003fe4:	bfb8      	it	lt
 8003fe6:	4613      	movlt	r3, r2
 8003fe8:	6033      	str	r3, [r6, #0]
 8003fea:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
 8003fee:	460c      	mov	r4, r1
 8003ff0:	f8dd 8020 	ldr.w	r8, [sp, #32]
 8003ff4:	b10a      	cbz	r2, 8003ffa <_printf_common+0x26>
 8003ff6:	3301      	adds	r3, #1
 8003ff8:	6033      	str	r3, [r6, #0]
 8003ffa:	6823      	ldr	r3, [r4, #0]
 8003ffc:	0699      	lsls	r1, r3, #26
 8003ffe:	bf42      	ittt	mi
 8004000:	6833      	ldrmi	r3, [r6, #0]
 8004002:	3302      	addmi	r3, #2
 8004004:	6033      	strmi	r3, [r6, #0]
 8004006:	6825      	ldr	r5, [r4, #0]
 8004008:	f015 0506 	ands.w	r5, r5, #6
 800400c:	d106      	bne.n	800401c <_printf_common+0x48>
 800400e:	f104 0a19 	add.w	sl, r4, #25
 8004012:	68e3      	ldr	r3, [r4, #12]
 8004014:	6832      	ldr	r2, [r6, #0]
 8004016:	1a9b      	subs	r3, r3, r2
 8004018:	42ab      	cmp	r3, r5
 800401a:	dc28      	bgt.n	800406e <_printf_common+0x9a>
 800401c:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
 8004020:	1e13      	subs	r3, r2, #0
 8004022:	6822      	ldr	r2, [r4, #0]
 8004024:	bf18      	it	ne
 8004026:	2301      	movne	r3, #1
 8004028:	0692      	lsls	r2, r2, #26
 800402a:	d42d      	bmi.n	8004088 <_printf_common+0xb4>
 800402c:	4649      	mov	r1, r9
 800402e:	4638      	mov	r0, r7
 8004030:	f104 0243 	add.w	r2, r4, #67	; 0x43
 8004034:	47c0      	blx	r8
 8004036:	3001      	adds	r0, #1
 8004038:	d020      	beq.n	800407c <_printf_common+0xa8>
 800403a:	6823      	ldr	r3, [r4, #0]
 800403c:	68e5      	ldr	r5, [r4, #12]
 800403e:	f003 0306 	and.w	r3, r3, #6
 8004042:	2b04      	cmp	r3, #4
 8004044:	bf18      	it	ne
 8004046:	2500      	movne	r5, #0
 8004048:	6832      	ldr	r2, [r6, #0]
 800404a:	f04f 0600 	mov.w	r6, #0
 800404e:	68a3      	ldr	r3, [r4, #8]
 8004050:	bf08      	it	eq
 8004052:	1aad      	subeq	r5, r5, r2
 8004054:	6922      	ldr	r2, [r4, #16]
 8004056:	bf08      	it	eq
 8004058:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
 800405c:	4293      	cmp	r3, r2
 800405e:	bfc4      	itt	gt
 8004060:	1a9b      	subgt	r3, r3, r2
 8004062:	18ed      	addgt	r5, r5, r3
 8004064:	341a      	adds	r4, #26
 8004066:	42b5      	cmp	r5, r6
 8004068:	d11a      	bne.n	80040a0 <_printf_common+0xcc>
 800406a:	2000      	movs	r0, #0
 800406c:	e008      	b.n	8004080 <_printf_common+0xac>
 800406e:	2301      	movs	r3, #1
 8004070:	4652      	mov	r2, sl
 8004072:	4649      	mov	r1, r9
 8004074:	4638      	mov	r0, r7
 8004076:	47c0      	blx	r8
 8004078:	3001      	adds	r0, #1
 800407a:	d103      	bne.n	8004084 <_printf_common+0xb0>
 800407c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8004080:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8004084:	3501      	adds	r5, #1
 8004086:	e7c4      	b.n	8004012 <_printf_common+0x3e>
 8004088:	2030      	movs	r0, #48	; 0x30
 800408a:	18e1      	adds	r1, r4, r3
 800408c:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
 8004090:	1c5a      	adds	r2, r3, #1
 8004092:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
 8004096:	4422      	add	r2, r4
 8004098:	3302      	adds	r3, #2
 800409a:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
 800409e:	e7c5      	b.n	800402c <_printf_common+0x58>
 80040a0:	2301      	movs	r3, #1
 80040a2:	4622      	mov	r2, r4
 80040a4:	4649      	mov	r1, r9
 80040a6:	4638      	mov	r0, r7
 80040a8:	47c0      	blx	r8
 80040aa:	3001      	adds	r0, #1
 80040ac:	d0e6      	beq.n	800407c <_printf_common+0xa8>
 80040ae:	3601      	adds	r6, #1
 80040b0:	e7d9      	b.n	8004066 <_printf_common+0x92>
	...

080040b4 <_printf_i>:
 80040b4:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
 80040b8:	7e0f      	ldrb	r7, [r1, #24]
 80040ba:	4691      	mov	r9, r2
 80040bc:	2f78      	cmp	r7, #120	; 0x78
 80040be:	4680      	mov	r8, r0
 80040c0:	460c      	mov	r4, r1
 80040c2:	469a      	mov	sl, r3
 80040c4:	9d0c      	ldr	r5, [sp, #48]	; 0x30
 80040c6:	f101 0243 	add.w	r2, r1, #67	; 0x43
 80040ca:	d807      	bhi.n	80040dc <_printf_i+0x28>
 80040cc:	2f62      	cmp	r7, #98	; 0x62
 80040ce:	d80a      	bhi.n	80040e6 <_printf_i+0x32>
 80040d0:	2f00      	cmp	r7, #0
 80040d2:	f000 80d9 	beq.w	8004288 <_printf_i+0x1d4>
 80040d6:	2f58      	cmp	r7, #88	; 0x58
 80040d8:	f000 80a4 	beq.w	8004224 <_printf_i+0x170>
 80040dc:	f104 0542 	add.w	r5, r4, #66	; 0x42
 80040e0:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
 80040e4:	e03a      	b.n	800415c <_printf_i+0xa8>
 80040e6:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
 80040ea:	2b15      	cmp	r3, #21
 80040ec:	d8f6      	bhi.n	80040dc <_printf_i+0x28>
 80040ee:	a101      	add	r1, pc, #4	; (adr r1, 80040f4 <_printf_i+0x40>)
 80040f0:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
 80040f4:	0800414d 	.word	0x0800414d
 80040f8:	08004161 	.word	0x08004161
 80040fc:	080040dd 	.word	0x080040dd
 8004100:	080040dd 	.word	0x080040dd
 8004104:	080040dd 	.word	0x080040dd
 8004108:	080040dd 	.word	0x080040dd
 800410c:	08004161 	.word	0x08004161
 8004110:	080040dd 	.word	0x080040dd
 8004114:	080040dd 	.word	0x080040dd
 8004118:	080040dd 	.word	0x080040dd
 800411c:	080040dd 	.word	0x080040dd
 8004120:	0800426f 	.word	0x0800426f
 8004124:	08004191 	.word	0x08004191
 8004128:	08004251 	.word	0x08004251
 800412c:	080040dd 	.word	0x080040dd
 8004130:	080040dd 	.word	0x080040dd
 8004134:	08004291 	.word	0x08004291
 8004138:	080040dd 	.word	0x080040dd
 800413c:	08004191 	.word	0x08004191
 8004140:	080040dd 	.word	0x080040dd
 8004144:	080040dd 	.word	0x080040dd
 8004148:	08004259 	.word	0x08004259
 800414c:	682b      	ldr	r3, [r5, #0]
 800414e:	1d1a      	adds	r2, r3, #4
 8004150:	681b      	ldr	r3, [r3, #0]
 8004152:	602a      	str	r2, [r5, #0]
 8004154:	f104 0542 	add.w	r5, r4, #66	; 0x42
 8004158:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
 800415c:	2301      	movs	r3, #1
 800415e:	e0a4      	b.n	80042aa <_printf_i+0x1f6>
 8004160:	6820      	ldr	r0, [r4, #0]
 8004162:	6829      	ldr	r1, [r5, #0]
 8004164:	0606      	lsls	r6, r0, #24
 8004166:	f101 0304 	add.w	r3, r1, #4
 800416a:	d50a      	bpl.n	8004182 <_printf_i+0xce>
 800416c:	680e      	ldr	r6, [r1, #0]
 800416e:	602b      	str	r3, [r5, #0]
 8004170:	2e00      	cmp	r6, #0
 8004172:	da03      	bge.n	800417c <_printf_i+0xc8>
 8004174:	232d      	movs	r3, #45	; 0x2d
 8004176:	4276      	negs	r6, r6
 8004178:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 800417c:	230a      	movs	r3, #10
 800417e:	485e      	ldr	r0, [pc, #376]	; (80042f8 <_printf_i+0x244>)
 8004180:	e019      	b.n	80041b6 <_printf_i+0x102>
 8004182:	680e      	ldr	r6, [r1, #0]
 8004184:	f010 0f40 	tst.w	r0, #64	; 0x40
 8004188:	602b      	str	r3, [r5, #0]
 800418a:	bf18      	it	ne
 800418c:	b236      	sxthne	r6, r6
 800418e:	e7ef      	b.n	8004170 <_printf_i+0xbc>
 8004190:	682b      	ldr	r3, [r5, #0]
 8004192:	6820      	ldr	r0, [r4, #0]
 8004194:	1d19      	adds	r1, r3, #4
 8004196:	6029      	str	r1, [r5, #0]
 8004198:	0601      	lsls	r1, r0, #24
 800419a:	d501      	bpl.n	80041a0 <_printf_i+0xec>
 800419c:	681e      	ldr	r6, [r3, #0]
 800419e:	e002      	b.n	80041a6 <_printf_i+0xf2>
 80041a0:	0646      	lsls	r6, r0, #25
 80041a2:	d5fb      	bpl.n	800419c <_printf_i+0xe8>
 80041a4:	881e      	ldrh	r6, [r3, #0]
 80041a6:	2f6f      	cmp	r7, #111	; 0x6f
 80041a8:	bf0c      	ite	eq
 80041aa:	2308      	moveq	r3, #8
 80041ac:	230a      	movne	r3, #10
 80041ae:	4852      	ldr	r0, [pc, #328]	; (80042f8 <_printf_i+0x244>)
 80041b0:	2100      	movs	r1, #0
 80041b2:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
 80041b6:	6865      	ldr	r5, [r4, #4]
 80041b8:	2d00      	cmp	r5, #0
 80041ba:	bfa8      	it	ge
 80041bc:	6821      	ldrge	r1, [r4, #0]
 80041be:	60a5      	str	r5, [r4, #8]
 80041c0:	bfa4      	itt	ge
 80041c2:	f021 0104 	bicge.w	r1, r1, #4
 80041c6:	6021      	strge	r1, [r4, #0]
 80041c8:	b90e      	cbnz	r6, 80041ce <_printf_i+0x11a>
 80041ca:	2d00      	cmp	r5, #0
 80041cc:	d04d      	beq.n	800426a <_printf_i+0x1b6>
 80041ce:	4615      	mov	r5, r2
 80041d0:	fbb6 f1f3 	udiv	r1, r6, r3
 80041d4:	fb03 6711 	mls	r7, r3, r1, r6
 80041d8:	5dc7      	ldrb	r7, [r0, r7]
 80041da:	f805 7d01 	strb.w	r7, [r5, #-1]!
 80041de:	4637      	mov	r7, r6
 80041e0:	42bb      	cmp	r3, r7
 80041e2:	460e      	mov	r6, r1
 80041e4:	d9f4      	bls.n	80041d0 <_printf_i+0x11c>
 80041e6:	2b08      	cmp	r3, #8
 80041e8:	d10b      	bne.n	8004202 <_printf_i+0x14e>
 80041ea:	6823      	ldr	r3, [r4, #0]
 80041ec:	07de      	lsls	r6, r3, #31
 80041ee:	d508      	bpl.n	8004202 <_printf_i+0x14e>
 80041f0:	6923      	ldr	r3, [r4, #16]
 80041f2:	6861      	ldr	r1, [r4, #4]
 80041f4:	4299      	cmp	r1, r3
 80041f6:	bfde      	ittt	le
 80041f8:	2330      	movle	r3, #48	; 0x30
 80041fa:	f805 3c01 	strble.w	r3, [r5, #-1]
 80041fe:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
 8004202:	1b52      	subs	r2, r2, r5
 8004204:	6122      	str	r2, [r4, #16]
 8004206:	464b      	mov	r3, r9
 8004208:	4621      	mov	r1, r4
 800420a:	4640      	mov	r0, r8
 800420c:	f8cd a000 	str.w	sl, [sp]
 8004210:	aa03      	add	r2, sp, #12
 8004212:	f7ff fedf 	bl	8003fd4 <_printf_common>
 8004216:	3001      	adds	r0, #1
 8004218:	d14c      	bne.n	80042b4 <_printf_i+0x200>
 800421a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800421e:	b004      	add	sp, #16
 8004220:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 8004224:	4834      	ldr	r0, [pc, #208]	; (80042f8 <_printf_i+0x244>)
 8004226:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
 800422a:	6829      	ldr	r1, [r5, #0]
 800422c:	6823      	ldr	r3, [r4, #0]
 800422e:	f851 6b04 	ldr.w	r6, [r1], #4
 8004232:	6029      	str	r1, [r5, #0]
 8004234:	061d      	lsls	r5, r3, #24
 8004236:	d514      	bpl.n	8004262 <_printf_i+0x1ae>
 8004238:	07df      	lsls	r7, r3, #31
 800423a:	bf44      	itt	mi
 800423c:	f043 0320 	orrmi.w	r3, r3, #32
 8004240:	6023      	strmi	r3, [r4, #0]
 8004242:	b91e      	cbnz	r6, 800424c <_printf_i+0x198>
 8004244:	6823      	ldr	r3, [r4, #0]
 8004246:	f023 0320 	bic.w	r3, r3, #32
 800424a:	6023      	str	r3, [r4, #0]
 800424c:	2310      	movs	r3, #16
 800424e:	e7af      	b.n	80041b0 <_printf_i+0xfc>
 8004250:	6823      	ldr	r3, [r4, #0]
 8004252:	f043 0320 	orr.w	r3, r3, #32
 8004256:	6023      	str	r3, [r4, #0]
 8004258:	2378      	movs	r3, #120	; 0x78
 800425a:	4828      	ldr	r0, [pc, #160]	; (80042fc <_printf_i+0x248>)
 800425c:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
 8004260:	e7e3      	b.n	800422a <_printf_i+0x176>
 8004262:	0659      	lsls	r1, r3, #25
 8004264:	bf48      	it	mi
 8004266:	b2b6      	uxthmi	r6, r6
 8004268:	e7e6      	b.n	8004238 <_printf_i+0x184>
 800426a:	4615      	mov	r5, r2
 800426c:	e7bb      	b.n	80041e6 <_printf_i+0x132>
 800426e:	682b      	ldr	r3, [r5, #0]
 8004270:	6826      	ldr	r6, [r4, #0]
 8004272:	1d18      	adds	r0, r3, #4
 8004274:	6961      	ldr	r1, [r4, #20]
 8004276:	6028      	str	r0, [r5, #0]
 8004278:	0635      	lsls	r5, r6, #24
 800427a:	681b      	ldr	r3, [r3, #0]
 800427c:	d501      	bpl.n	8004282 <_printf_i+0x1ce>
 800427e:	6019      	str	r1, [r3, #0]
 8004280:	e002      	b.n	8004288 <_printf_i+0x1d4>
 8004282:	0670      	lsls	r0, r6, #25
 8004284:	d5fb      	bpl.n	800427e <_printf_i+0x1ca>
 8004286:	8019      	strh	r1, [r3, #0]
 8004288:	2300      	movs	r3, #0
 800428a:	4615      	mov	r5, r2
 800428c:	6123      	str	r3, [r4, #16]
 800428e:	e7ba      	b.n	8004206 <_printf_i+0x152>
 8004290:	682b      	ldr	r3, [r5, #0]
 8004292:	2100      	movs	r1, #0
 8004294:	1d1a      	adds	r2, r3, #4
 8004296:	602a      	str	r2, [r5, #0]
 8004298:	681d      	ldr	r5, [r3, #0]
 800429a:	6862      	ldr	r2, [r4, #4]
 800429c:	4628      	mov	r0, r5
 800429e:	f000 f8d9 	bl	8004454 <memchr>
 80042a2:	b108      	cbz	r0, 80042a8 <_printf_i+0x1f4>
 80042a4:	1b40      	subs	r0, r0, r5
 80042a6:	6060      	str	r0, [r4, #4]
 80042a8:	6863      	ldr	r3, [r4, #4]
 80042aa:	6123      	str	r3, [r4, #16]
 80042ac:	2300      	movs	r3, #0
 80042ae:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 80042b2:	e7a8      	b.n	8004206 <_printf_i+0x152>
 80042b4:	462a      	mov	r2, r5
 80042b6:	4649      	mov	r1, r9
 80042b8:	4640      	mov	r0, r8
 80042ba:	6923      	ldr	r3, [r4, #16]
 80042bc:	47d0      	blx	sl
 80042be:	3001      	adds	r0, #1
 80042c0:	d0ab      	beq.n	800421a <_printf_i+0x166>
 80042c2:	6823      	ldr	r3, [r4, #0]
 80042c4:	079b      	lsls	r3, r3, #30
 80042c6:	d413      	bmi.n	80042f0 <_printf_i+0x23c>
 80042c8:	68e0      	ldr	r0, [r4, #12]
 80042ca:	9b03      	ldr	r3, [sp, #12]
 80042cc:	4298      	cmp	r0, r3
 80042ce:	bfb8      	it	lt
 80042d0:	4618      	movlt	r0, r3
 80042d2:	e7a4      	b.n	800421e <_printf_i+0x16a>
 80042d4:	2301      	movs	r3, #1
 80042d6:	4632      	mov	r2, r6
 80042d8:	4649      	mov	r1, r9
 80042da:	4640      	mov	r0, r8
 80042dc:	47d0      	blx	sl
 80042de:	3001      	adds	r0, #1
 80042e0:	d09b      	beq.n	800421a <_printf_i+0x166>
 80042e2:	3501      	adds	r5, #1
 80042e4:	68e3      	ldr	r3, [r4, #12]
 80042e6:	9903      	ldr	r1, [sp, #12]
 80042e8:	1a5b      	subs	r3, r3, r1
 80042ea:	42ab      	cmp	r3, r5
 80042ec:	dcf2      	bgt.n	80042d4 <_printf_i+0x220>
 80042ee:	e7eb      	b.n	80042c8 <_printf_i+0x214>
 80042f0:	2500      	movs	r5, #0
 80042f2:	f104 0619 	add.w	r6, r4, #25
 80042f6:	e7f5      	b.n	80042e4 <_printf_i+0x230>
 80042f8:	080048e1 	.word	0x080048e1
 80042fc:	080048f2 	.word	0x080048f2

08004300 <_sbrk_r>:
 8004300:	b538      	push	{r3, r4, r5, lr}
 8004302:	2300      	movs	r3, #0
 8004304:	4d05      	ldr	r5, [pc, #20]	; (800431c <_sbrk_r+0x1c>)
 8004306:	4604      	mov	r4, r0
 8004308:	4608      	mov	r0, r1
 800430a:	602b      	str	r3, [r5, #0]
 800430c:	f000 f948 	bl	80045a0 <_sbrk>
 8004310:	1c43      	adds	r3, r0, #1
 8004312:	d102      	bne.n	800431a <_sbrk_r+0x1a>
 8004314:	682b      	ldr	r3, [r5, #0]
 8004316:	b103      	cbz	r3, 800431a <_sbrk_r+0x1a>
 8004318:	6023      	str	r3, [r4, #0]
 800431a:	bd38      	pop	{r3, r4, r5, pc}
 800431c:	2000de20 	.word	0x2000de20

08004320 <__sread>:
 8004320:	b510      	push	{r4, lr}
 8004322:	460c      	mov	r4, r1
 8004324:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8004328:	f000 f8f8 	bl	800451c <_read_r>
 800432c:	2800      	cmp	r0, #0
 800432e:	bfab      	itete	ge
 8004330:	6d63      	ldrge	r3, [r4, #84]	; 0x54
 8004332:	89a3      	ldrhlt	r3, [r4, #12]
 8004334:	181b      	addge	r3, r3, r0
 8004336:	f423 5380 	biclt.w	r3, r3, #4096	; 0x1000
 800433a:	bfac      	ite	ge
 800433c:	6563      	strge	r3, [r4, #84]	; 0x54
 800433e:	81a3      	strhlt	r3, [r4, #12]
 8004340:	bd10      	pop	{r4, pc}

08004342 <__swrite>:
 8004342:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8004346:	461f      	mov	r7, r3
 8004348:	898b      	ldrh	r3, [r1, #12]
 800434a:	4605      	mov	r5, r0
 800434c:	05db      	lsls	r3, r3, #23
 800434e:	460c      	mov	r4, r1
 8004350:	4616      	mov	r6, r2
 8004352:	d505      	bpl.n	8004360 <__swrite+0x1e>
 8004354:	2302      	movs	r3, #2
 8004356:	2200      	movs	r2, #0
 8004358:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 800435c:	f000 f868 	bl	8004430 <_lseek_r>
 8004360:	89a3      	ldrh	r3, [r4, #12]
 8004362:	4632      	mov	r2, r6
 8004364:	f423 5380 	bic.w	r3, r3, #4096	; 0x1000
 8004368:	81a3      	strh	r3, [r4, #12]
 800436a:	4628      	mov	r0, r5
 800436c:	463b      	mov	r3, r7
 800436e:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
 8004372:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 8004376:	f000 b817 	b.w	80043a8 <_write_r>

0800437a <__sseek>:
 800437a:	b510      	push	{r4, lr}
 800437c:	460c      	mov	r4, r1
 800437e:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 8004382:	f000 f855 	bl	8004430 <_lseek_r>
 8004386:	1c43      	adds	r3, r0, #1
 8004388:	89a3      	ldrh	r3, [r4, #12]
 800438a:	bf15      	itete	ne
 800438c:	6560      	strne	r0, [r4, #84]	; 0x54
 800438e:	f423 5380 	biceq.w	r3, r3, #4096	; 0x1000
 8004392:	f443 5380 	orrne.w	r3, r3, #4096	; 0x1000
 8004396:	81a3      	strheq	r3, [r4, #12]
 8004398:	bf18      	it	ne
 800439a:	81a3      	strhne	r3, [r4, #12]
 800439c:	bd10      	pop	{r4, pc}

0800439e <__sclose>:
 800439e:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
 80043a2:	f000 b813 	b.w	80043cc <_close_r>
	...

080043a8 <_write_r>:
 80043a8:	b538      	push	{r3, r4, r5, lr}
 80043aa:	4604      	mov	r4, r0
 80043ac:	4608      	mov	r0, r1
 80043ae:	4611      	mov	r1, r2
 80043b0:	2200      	movs	r2, #0
 80043b2:	4d05      	ldr	r5, [pc, #20]	; (80043c8 <_write_r+0x20>)
 80043b4:	602a      	str	r2, [r5, #0]
 80043b6:	461a      	mov	r2, r3
 80043b8:	f7fe fdbe 	bl	8002f38 <_write>
 80043bc:	1c43      	adds	r3, r0, #1
 80043be:	d102      	bne.n	80043c6 <_write_r+0x1e>
 80043c0:	682b      	ldr	r3, [r5, #0]
 80043c2:	b103      	cbz	r3, 80043c6 <_write_r+0x1e>
 80043c4:	6023      	str	r3, [r4, #0]
 80043c6:	bd38      	pop	{r3, r4, r5, pc}
 80043c8:	2000de20 	.word	0x2000de20

080043cc <_close_r>:
 80043cc:	b538      	push	{r3, r4, r5, lr}
 80043ce:	2300      	movs	r3, #0
 80043d0:	4d05      	ldr	r5, [pc, #20]	; (80043e8 <_close_r+0x1c>)
 80043d2:	4604      	mov	r4, r0
 80043d4:	4608      	mov	r0, r1
 80043d6:	602b      	str	r3, [r5, #0]
 80043d8:	f000 f8ba 	bl	8004550 <_close>
 80043dc:	1c43      	adds	r3, r0, #1
 80043de:	d102      	bne.n	80043e6 <_close_r+0x1a>
 80043e0:	682b      	ldr	r3, [r5, #0]
 80043e2:	b103      	cbz	r3, 80043e6 <_close_r+0x1a>
 80043e4:	6023      	str	r3, [r4, #0]
 80043e6:	bd38      	pop	{r3, r4, r5, pc}
 80043e8:	2000de20 	.word	0x2000de20

080043ec <_fstat_r>:
 80043ec:	b538      	push	{r3, r4, r5, lr}
 80043ee:	2300      	movs	r3, #0
 80043f0:	4d06      	ldr	r5, [pc, #24]	; (800440c <_fstat_r+0x20>)
 80043f2:	4604      	mov	r4, r0
 80043f4:	4608      	mov	r0, r1
 80043f6:	4611      	mov	r1, r2
 80043f8:	602b      	str	r3, [r5, #0]
 80043fa:	f000 f8b1 	bl	8004560 <_fstat>
 80043fe:	1c43      	adds	r3, r0, #1
 8004400:	d102      	bne.n	8004408 <_fstat_r+0x1c>
 8004402:	682b      	ldr	r3, [r5, #0]
 8004404:	b103      	cbz	r3, 8004408 <_fstat_r+0x1c>
 8004406:	6023      	str	r3, [r4, #0]
 8004408:	bd38      	pop	{r3, r4, r5, pc}
 800440a:	bf00      	nop
 800440c:	2000de20 	.word	0x2000de20

08004410 <_isatty_r>:
 8004410:	b538      	push	{r3, r4, r5, lr}
 8004412:	2300      	movs	r3, #0
 8004414:	4d05      	ldr	r5, [pc, #20]	; (800442c <_isatty_r+0x1c>)
 8004416:	4604      	mov	r4, r0
 8004418:	4608      	mov	r0, r1
 800441a:	602b      	str	r3, [r5, #0]
 800441c:	f000 f8a8 	bl	8004570 <_isatty>
 8004420:	1c43      	adds	r3, r0, #1
 8004422:	d102      	bne.n	800442a <_isatty_r+0x1a>
 8004424:	682b      	ldr	r3, [r5, #0]
 8004426:	b103      	cbz	r3, 800442a <_isatty_r+0x1a>
 8004428:	6023      	str	r3, [r4, #0]
 800442a:	bd38      	pop	{r3, r4, r5, pc}
 800442c:	2000de20 	.word	0x2000de20

08004430 <_lseek_r>:
 8004430:	b538      	push	{r3, r4, r5, lr}
 8004432:	4604      	mov	r4, r0
 8004434:	4608      	mov	r0, r1
 8004436:	4611      	mov	r1, r2
 8004438:	2200      	movs	r2, #0
 800443a:	4d05      	ldr	r5, [pc, #20]	; (8004450 <_lseek_r+0x20>)
 800443c:	602a      	str	r2, [r5, #0]
 800443e:	461a      	mov	r2, r3
 8004440:	f000 f89e 	bl	8004580 <_lseek>
 8004444:	1c43      	adds	r3, r0, #1
 8004446:	d102      	bne.n	800444e <_lseek_r+0x1e>
 8004448:	682b      	ldr	r3, [r5, #0]
 800444a:	b103      	cbz	r3, 800444e <_lseek_r+0x1e>
 800444c:	6023      	str	r3, [r4, #0]
 800444e:	bd38      	pop	{r3, r4, r5, pc}
 8004450:	2000de20 	.word	0x2000de20

08004454 <memchr>:
 8004454:	4603      	mov	r3, r0
 8004456:	b510      	push	{r4, lr}
 8004458:	b2c9      	uxtb	r1, r1
 800445a:	4402      	add	r2, r0
 800445c:	4293      	cmp	r3, r2
 800445e:	4618      	mov	r0, r3
 8004460:	d101      	bne.n	8004466 <memchr+0x12>
 8004462:	2000      	movs	r0, #0
 8004464:	e003      	b.n	800446e <memchr+0x1a>
 8004466:	7804      	ldrb	r4, [r0, #0]
 8004468:	3301      	adds	r3, #1
 800446a:	428c      	cmp	r4, r1
 800446c:	d1f6      	bne.n	800445c <memchr+0x8>
 800446e:	bd10      	pop	{r4, pc}

08004470 <memmove>:
 8004470:	4288      	cmp	r0, r1
 8004472:	b510      	push	{r4, lr}
 8004474:	eb01 0402 	add.w	r4, r1, r2
 8004478:	d902      	bls.n	8004480 <memmove+0x10>
 800447a:	4284      	cmp	r4, r0
 800447c:	4623      	mov	r3, r4
 800447e:	d807      	bhi.n	8004490 <memmove+0x20>
 8004480:	1e43      	subs	r3, r0, #1
 8004482:	42a1      	cmp	r1, r4
 8004484:	d008      	beq.n	8004498 <memmove+0x28>
 8004486:	f811 2b01 	ldrb.w	r2, [r1], #1
 800448a:	f803 2f01 	strb.w	r2, [r3, #1]!
 800448e:	e7f8      	b.n	8004482 <memmove+0x12>
 8004490:	4601      	mov	r1, r0
 8004492:	4402      	add	r2, r0
 8004494:	428a      	cmp	r2, r1
 8004496:	d100      	bne.n	800449a <memmove+0x2a>
 8004498:	bd10      	pop	{r4, pc}
 800449a:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
 800449e:	f802 4d01 	strb.w	r4, [r2, #-1]!
 80044a2:	e7f7      	b.n	8004494 <memmove+0x24>

080044a4 <__malloc_lock>:
 80044a4:	4801      	ldr	r0, [pc, #4]	; (80044ac <__malloc_lock+0x8>)
 80044a6:	f7ff b99d 	b.w	80037e4 <__retarget_lock_acquire_recursive>
 80044aa:	bf00      	nop
 80044ac:	2000de14 	.word	0x2000de14

080044b0 <__malloc_unlock>:
 80044b0:	4801      	ldr	r0, [pc, #4]	; (80044b8 <__malloc_unlock+0x8>)
 80044b2:	f7ff b998 	b.w	80037e6 <__retarget_lock_release_recursive>
 80044b6:	bf00      	nop
 80044b8:	2000de14 	.word	0x2000de14

080044bc <_realloc_r>:
 80044bc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80044c0:	4680      	mov	r8, r0
 80044c2:	4614      	mov	r4, r2
 80044c4:	460e      	mov	r6, r1
 80044c6:	b921      	cbnz	r1, 80044d2 <_realloc_r+0x16>
 80044c8:	4611      	mov	r1, r2
 80044ca:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
 80044ce:	f7ff ba59 	b.w	8003984 <_malloc_r>
 80044d2:	b92a      	cbnz	r2, 80044e0 <_realloc_r+0x24>
 80044d4:	f7ff f9ee 	bl	80038b4 <_free_r>
 80044d8:	4625      	mov	r5, r4
 80044da:	4628      	mov	r0, r5
 80044dc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80044e0:	f000 f82e 	bl	8004540 <_malloc_usable_size_r>
 80044e4:	4284      	cmp	r4, r0
 80044e6:	4607      	mov	r7, r0
 80044e8:	d802      	bhi.n	80044f0 <_realloc_r+0x34>
 80044ea:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
 80044ee:	d812      	bhi.n	8004516 <_realloc_r+0x5a>
 80044f0:	4621      	mov	r1, r4
 80044f2:	4640      	mov	r0, r8
 80044f4:	f7ff fa46 	bl	8003984 <_malloc_r>
 80044f8:	4605      	mov	r5, r0
 80044fa:	2800      	cmp	r0, #0
 80044fc:	d0ed      	beq.n	80044da <_realloc_r+0x1e>
 80044fe:	42bc      	cmp	r4, r7
 8004500:	4622      	mov	r2, r4
 8004502:	4631      	mov	r1, r6
 8004504:	bf28      	it	cs
 8004506:	463a      	movcs	r2, r7
 8004508:	f7fe fe28 	bl	800315c <memcpy>
 800450c:	4631      	mov	r1, r6
 800450e:	4640      	mov	r0, r8
 8004510:	f7ff f9d0 	bl	80038b4 <_free_r>
 8004514:	e7e1      	b.n	80044da <_realloc_r+0x1e>
 8004516:	4635      	mov	r5, r6
 8004518:	e7df      	b.n	80044da <_realloc_r+0x1e>
	...

0800451c <_read_r>:
 800451c:	b538      	push	{r3, r4, r5, lr}
 800451e:	4604      	mov	r4, r0
 8004520:	4608      	mov	r0, r1
 8004522:	4611      	mov	r1, r2
 8004524:	2200      	movs	r2, #0
 8004526:	4d05      	ldr	r5, [pc, #20]	; (800453c <_read_r+0x20>)
 8004528:	602a      	str	r2, [r5, #0]
 800452a:	461a      	mov	r2, r3
 800452c:	f000 f830 	bl	8004590 <_read>
 8004530:	1c43      	adds	r3, r0, #1
 8004532:	d102      	bne.n	800453a <_read_r+0x1e>
 8004534:	682b      	ldr	r3, [r5, #0]
 8004536:	b103      	cbz	r3, 800453a <_read_r+0x1e>
 8004538:	6023      	str	r3, [r4, #0]
 800453a:	bd38      	pop	{r3, r4, r5, pc}
 800453c:	2000de20 	.word	0x2000de20

08004540 <_malloc_usable_size_r>:
 8004540:	f851 3c04 	ldr.w	r3, [r1, #-4]
 8004544:	1f18      	subs	r0, r3, #4
 8004546:	2b00      	cmp	r3, #0
 8004548:	bfbc      	itt	lt
 800454a:	580b      	ldrlt	r3, [r1, r0]
 800454c:	18c0      	addlt	r0, r0, r3
 800454e:	4770      	bx	lr

08004550 <_close>:
 8004550:	2258      	movs	r2, #88	; 0x58
 8004552:	4b02      	ldr	r3, [pc, #8]	; (800455c <_close+0xc>)
 8004554:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8004558:	601a      	str	r2, [r3, #0]
 800455a:	4770      	bx	lr
 800455c:	2000de20 	.word	0x2000de20

08004560 <_fstat>:
 8004560:	2258      	movs	r2, #88	; 0x58
 8004562:	4b02      	ldr	r3, [pc, #8]	; (800456c <_fstat+0xc>)
 8004564:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8004568:	601a      	str	r2, [r3, #0]
 800456a:	4770      	bx	lr
 800456c:	2000de20 	.word	0x2000de20

08004570 <_isatty>:
 8004570:	2258      	movs	r2, #88	; 0x58
 8004572:	4b02      	ldr	r3, [pc, #8]	; (800457c <_isatty+0xc>)
 8004574:	2000      	movs	r0, #0
 8004576:	601a      	str	r2, [r3, #0]
 8004578:	4770      	bx	lr
 800457a:	bf00      	nop
 800457c:	2000de20 	.word	0x2000de20

08004580 <_lseek>:
 8004580:	2258      	movs	r2, #88	; 0x58
 8004582:	4b02      	ldr	r3, [pc, #8]	; (800458c <_lseek+0xc>)
 8004584:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8004588:	601a      	str	r2, [r3, #0]
 800458a:	4770      	bx	lr
 800458c:	2000de20 	.word	0x2000de20

08004590 <_read>:
 8004590:	2258      	movs	r2, #88	; 0x58
 8004592:	4b02      	ldr	r3, [pc, #8]	; (800459c <_read+0xc>)
 8004594:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8004598:	601a      	str	r2, [r3, #0]
 800459a:	4770      	bx	lr
 800459c:	2000de20 	.word	0x2000de20

080045a0 <_sbrk>:
 80045a0:	4a04      	ldr	r2, [pc, #16]	; (80045b4 <_sbrk+0x14>)
 80045a2:	4905      	ldr	r1, [pc, #20]	; (80045b8 <_sbrk+0x18>)
 80045a4:	6813      	ldr	r3, [r2, #0]
 80045a6:	2b00      	cmp	r3, #0
 80045a8:	bf08      	it	eq
 80045aa:	460b      	moveq	r3, r1
 80045ac:	4418      	add	r0, r3
 80045ae:	6010      	str	r0, [r2, #0]
 80045b0:	4618      	mov	r0, r3
 80045b2:	4770      	bx	lr
 80045b4:	2000de24 	.word	0x2000de24
 80045b8:	2000de28 	.word	0x2000de28

080045bc <_init>:
 80045bc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80045be:	bf00      	nop
 80045c0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80045c2:	bc08      	pop	{r3}
 80045c4:	469e      	mov	lr, r3
 80045c6:	4770      	bx	lr

080045c8 <_fini>:
 80045c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80045ca:	bf00      	nop
 80045cc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80045ce:	bc08      	pop	{r3}
 80045d0:	469e      	mov	lr, r3
 80045d2:	4770      	bx	lr
