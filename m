From: Johan Bilien <jobi@via.ecp.fr>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 18:07:28 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813160728.GA29189@via.ecp.fr>
References: <20030813140443.GE1372@poupinou.org> <20030813141141.GB28615@via.ecp.fr> <20030813143221.GF1372@poupinou.org> <20030813145631.GA28850@via.ecp.fr> <20030813150357.GH1372@poupinou.org> <20030813152646.GA28995@via.ecp.fr> <20030813153043.GI1372@poupinou.org> <20030813153343.GJ1372@poupinou.org> <20030813154615.GA29077@via.ecp.fr> <20030813154852.GK1372@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030813154852.GK1372@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Wed, Aug 13, 2003, Ducrot Bruno wrote:
> I should be more precise.  Just the first if().  The
> 	if (c->x86_mask == 0x01)
> 		return ...
> 	else
> 		return ...
> 
> is needed..

That's what I had understood, just wanted to be sure.

Here's what I get in the syslog when I modprobe  speedstep-piix4
gpo_hilo=0 (I still get nothing in /sys/devices...)

Aug 13 18:02:36 naboo kernel: cpufreq: Coppermine:
MSR_IA32_EBL_CR_POWERON is 0x4c080020, 0x0
Aug 13 18:02:36 naboo kernel: cpufreq: Coppermine: MSR_IA32_PLATFORM ID
is 0x0, 0x550000
Aug 13 18:02:36 naboo kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x4c080020 0x0
Aug 13 18:02:36 naboo kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x4c080020 0x0
Aug 13 18:02:36 naboo kernel: cntb before: 0x000000e1
Aug 13 18:02:36 naboo kernel: cntb after:  0x000007e1
Aug 13 18:02:36 naboo kernel: reading 7f7786fe from 1034
Aug 13 18:02:36 naboo kernel: new gpo: 7f7786ff
Aug 13 18:02:36 naboo kernel: pcntrl before: 0x00000200
Aug 13 18:02:36 naboo kernel: pcntrl after:  0x00001a00
Aug 13 18:02:36 naboo kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Aug 13 18:02:36 naboo kernel: cpufreq: change to 0 MHz succeded
Aug 13 18:02:36 naboo kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Aug 13 18:02:36 naboo kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Aug 13 18:02:36 naboo kernel: cntb before: 0x000000e1
Aug 13 18:02:36 naboo kernel: cntb after:  0x000007e1
Aug 13 18:02:36 naboo kernel: reading 7f7786ff from 1034
Aug 13 18:02:36 naboo kernel: new gpo: 7f7786fe
Aug 13 18:02:36 naboo kernel: pcntrl before: 0x00000200
Aug 13 18:02:36 naboo kernel: pcntrl after:  0x00001a00
Aug 13 18:02:36 naboo kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Aug 13 18:02:36 naboo kernel: cpufreq: change failed
Aug 13 18:02:36 naboo kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0

-- 
Jobi
