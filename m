From: Kenneth Ho <ken.ho@theorem.ca>
Subject: Re: speedstep-piix4 don't work
Date: Wed, 09 Jul 2003 02:09:41 -0400
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F0BB1A5.7040606@theorem.ca>
References: <3F0AED86.7040500@theorem.ca> <20030708163556.GM7796@poupinou.org> <3F0B033D.3090709@theorem.ca> <20030708181735.GN7796@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030708181735.GN7796@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Ducrot Bruno wrote:

>I can not promise you anything, but can you try the patch attached?
>
>This also add a little bit more debug output (just to check that
>I do it ok for gpo stuff) and the fix may be in the lines
>that look like:
>
>	pcntrl |= 1 << 9;               /* CC_EN = 1 */
>and
>	pcntrl |= (0x3 << 1);
>
>
>--- linux-2.4.21-ac4/arch/i386/kernel/speedstep-piix4.c	2003/07/08 18:01:49	1.1
>+++ linux-2.4.21-ac4/arch/i386/kernel/speedstep-piix4.c	2003/07/08 18:08:17
>@@ -123,9 +123,11 @@
> 	/* read state */
> 	value = inb_p(pmbase + gpo_hilo_port);
> 
>+	dprintk(KERN_DEBUG "speedstep: reading %.2x from port %.4x\n", value, pmbase + gpo_hilo_port);
> 	/* compute new state */
> 	value &= ~(1 << gpo_hilo_shift);
> 	value |= state << gpo_hilo_shift;
>+	dprintk(KERN_DEBUG "speedstep: new gpo value: 0x%.2x\n", value);
> 
> 	/* disable bus master arbitration */
> 	pm2_blk = inb(0x22);
>@@ -139,12 +141,12 @@
> 	pcntrl |= 1 << 12;              /* STPCLK_EN = 1 */
> 	pcntrl |= 1 << 11;              /* SLEEP_EN = 1 */
> 	pcntrl &= ~(1 << 10);           /* BURST_EN = 0 */
>-	pcntrl &= ~(1 << 9);            /* CC_EN = 0 */
>+	pcntrl |= 1 << 9;               /* CC_EN = 1 */
> 	pcntrl &= ~(1 << 4);            /* THT_EN = 0 */
> 
> 	/* We may have to define a 'good' throttling duty ? */
> 	pcntrl &= ~(0x7 << 1);
>-	pcntrl |= (0x2 << 1);
>+	pcntrl |= (0x3 << 1);
> 
> 	dprintk(KERN_DEBUG "pcntrl before: 0x%.8x\n", pcntrl_save);
> 	dprintk(KERN_DEBUG "pcntrl after:  0x%.8x\n", pcntrl);
>@@ -323,7 +325,7 @@
> 
> 	gpo_hilo_port = 0x34 + (gpo_hilo / 8);
> 	gpo_hilo_shift = (gpo_hilo % 8);
>-
>+	dprintk(KERN_INFO "speedstep: gpo port: 0x%.2x shift: 0x%.2x\n", gpo_hilo_port, gpo_hilo_shift);
> 	return cpufreq_register_driver(&speedstep_driver);
> }
> 
>
>  
>
No good - still won't change frequency.

dmesg output follows after the patch:

cpufreq: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x44080020, 0x0
cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x2540000
speedstep: gpo port: 0x34 shift: 0x00
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cntb before: 0x000000e1
cntb after:  0x000007e1
speedstep: reading ff from port 1034
speedstep: new gpo value: 0xff
pcntrl before: 0x00001200
pcntrl after:  0x00001a06
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cpufreq: change failed
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cntb before: 0x000000e1
cntb after:  0x000007e1
speedstep: reading ff from port 1034
speedstep: new gpo value: 0xfe
pcntrl before: 0x00001200
pcntrl after:  0x00001a06
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cpufreq: change failed
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
