From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: speedstep-piix4 don't work
Date: Wed, 9 Jul 2003 12:08:34 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030709100834.GP7796@poupinou.org>
References: <3F0AED86.7040500@theorem.ca> <20030708163556.GM7796@poupinou.org> <3F0B033D.3090709@theorem.ca> <20030708181735.GN7796@poupinou.org> <3F0BB1A5.7040606@theorem.ca>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F0BB1A5.7040606@theorem.ca>
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
To: Kenneth Ho <ken.ho@theorem.ca>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 09, 2003 at 02:09:41AM -0400, Kenneth Ho wrote:
> cpufreq: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x44080020, 0x0
> cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x2540000
> speedstep: gpo port: 0x34 shift: 0x00
> speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
> speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
> cntb before: 0x000000e1
> cntb after:  0x000007e1
> speedstep: reading ff from port 1034
> speedstep: new gpo value: 0xff
> pcntrl before: 0x00001200
> pcntrl after:  0x00001a06
> speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
> cpufreq: change failed
> speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
> speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
> cntb before: 0x000000e1
> cntb after:  0x000007e1
> speedstep: reading ff from port 1034
> speedstep: new gpo value: 0xfe
> pcntrl before: 0x00001200
> pcntrl after:  0x00001a06
> speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
> cpufreq: change failed
> speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0

Ok.  Could you remove the lines:
    145         /* We may have to define a 'good' throttling duty ? */
    146         pcntrl &= ~(0x7 << 1);
    147         pcntrl |= (0x3 << 1);
    148 

That will done exactly the same stuff as the old independant kernel module.
If that still do not work, well I will be a little puzzled then, but give
me still dmesg in any case.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
