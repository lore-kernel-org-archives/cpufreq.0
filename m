From: Stephan Diestelhorst <langer_mann@web.de>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Mon, 10 Mar 2008 16:05:41 +0100
Message-ID: <200803101605.42251.langer_mann@web.de>
References: <200803051559.09962.langer_mann@web.de> <200803060951.12002.langer_mann@web.de> <20080306105603.GL13391@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753296AbYCJQQ4@vger.kernel.org>
In-Reply-To: <20080306105603.GL13391@elte.hu>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo@elte.hu>
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

Ingo Molnar wrote:
> > Again, should I provide these patches? This thing just annoyed me for 
> > a while as I have been patching it in my personal kernels for too 
> > long.
> 
> yes, please do keep sending them (and any other patches you might have) 
> - it's a real issue on real hardware so we want this fix upstream.

New attempt with full clobbers, note that I deliberatly did not change
the order of the output registers. Real output operands still preceede
outputs used for potential clobbering.

I'm not too sure about the EBP push/pop frame, but as folks pointed
out already, we should not trust the SMI code too much.

Regards,
  Stephan

--
Signed-off by: <Stephan.Diestelhorst@gmail.com>

--- linux-2.6.24.3/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c.orig	2008-02-26 01:20:20.000000000 +0100
+++ linux-2.6.24.3/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c	2008-03-10 16:02:51.000000000 +0100
@@ -63,7 +63,7 @@ static struct cpufreq_frequency_table sp
  */
 static int speedstep_smi_ownership (void)
 {
-	u32 command, result, magic;
+	u32 command, result, magic, dummy;
 	u32 function = GET_SPEEDSTEP_OWNER;
 	unsigned char magic_data[] = "Copyright (c) 1999 Intel Corporation";
 
@@ -73,8 +73,11 @@ static int speedstep_smi_ownership (void
 	dprintk("trying to obtain ownership with command %x at port %x\n", command, smi_port);
 
 	__asm__ __volatile__(
+		"push %%ebp\n"
 		"out %%al, (%%dx)\n"
-		: "=D" (result)
+		"pop %%ebp\n"
+		: "=D" (result), "=a" (dummy), "=b" (dummy),"=c" (dummy),"=d" (dummy),
+			"=S" (dummy)
 		: "a" (command), "b" (function), "c" (0), "d" (smi_port),
 			"D" (0), "S" (magic)
 		: "memory"
@@ -96,7 +99,7 @@ static int speedstep_smi_ownership (void
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
 {
-	u32 command, result = 0, edi, high_mhz, low_mhz;
+	u32 command, result = 0, edi, high_mhz, low_mhz, dummy;
 	u32 state=0;
 	u32 function = GET_SPEEDSTEP_FREQS;
 
@@ -109,10 +112,12 @@ static int speedstep_smi_get_freqs (unsi
 
 	dprintk("trying to determine frequencies with command %x at port %x\n", command, smi_port);
 
-	__asm__ __volatile__("movl $0, %%edi\n"
+	__asm__ __volatile__(
+		"push %%ebp\n"
 		"out %%al, (%%dx)\n"
-		: "=a" (result), "=b" (high_mhz), "=c" (low_mhz), "=d" (state), "=D" (edi)
-		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
+		"pop %%ebp"
+		: "=a" (result), "=b" (high_mhz), "=c" (low_mhz), "=d" (state), "=D" (edi), "=S" (dummy)
+		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0), "D" (0)
 	);
 
 	dprintk("result %x, low_freq %u, high_freq %u\n", result, low_mhz, high_mhz);
@@ -135,16 +140,18 @@ static int speedstep_smi_get_freqs (unsi
 static int speedstep_get_state (void)
 {
 	u32 function=GET_SPEEDSTEP_STATE;
-	u32 result, state, edi, command;
+	u32 result, state, edi, command, dummy;
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
 	dprintk("trying to determine current setting with command %x at port %x\n", command, smi_port);
 
-	__asm__ __volatile__("movl $0, %%edi\n"
+	__asm__ __volatile__(
+		"push %%ebp\n"
 		"out %%al, (%%dx)\n"
-		: "=a" (result), "=b" (state), "=D" (edi)
-		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0)
+		"pop %%ebp\n"
+		: "=a" (result), "=b" (state), "=D" (edi), "=c" (dummy), "=d" (dummy), "=S" (dummy)
+		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0), "D" (0)
 	);
 
 	dprintk("state is %x, result is %x\n", state, result);
@@ -160,7 +167,7 @@ static int speedstep_get_state (void)
  */
 static void speedstep_set_state (unsigned int state)
 {
-	unsigned int result = 0, command, new_state;
+	unsigned int result = 0, command, new_state, dummy;
 	unsigned long flags;
 	unsigned int function=SET_SPEEDSTEP_STATE;
 	unsigned int retry = 0;
@@ -182,10 +189,12 @@ static void speedstep_set_state (unsigne
 		}
 		retry++;
 		__asm__ __volatile__(
-			"movl $0, %%edi\n"
+			"push %%ebp\n"
 			"out %%al, (%%dx)\n"
-			: "=b" (new_state), "=D" (result)
-			: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
+			"pop %%ebp"
+			: "=b" (new_state), "=D" (result), "=c" (dummy), "=a" (dummy),
+				"=d" (dummy), "=S" (dummy)
+			: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0), "D" (0)
 			);
 	} while ((new_state != state) && (retry <= SMI_TRIES));
 
@@ -195,7 +204,7 @@ static void speedstep_set_state (unsigne
 	if (new_state == state) {
 		dprintk("change to %u MHz succeeded after %u tries with result %u\n", (speedstep_freqs[new_state].frequency / 1000), retry, result);
 	} else {
-		printk(KERN_ERR "cpufreq: change failed with new_state %u and result %u\n", new_state, result);
+		printk(KERN_ERR "cpufreq: change to state %u failed with new_state %u and result %u\n", state, new_state, result);
 	}
 
 	return;
