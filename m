From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: speedstep-piix4 don't work
Date: Tue, 8 Jul 2003 18:35:56 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030708163556.GM7796@poupinou.org>
References: <3F0AED86.7040500@theorem.ca>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F0AED86.7040500@theorem.ca>
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

On Tue, Jul 08, 2003 at 12:12:54PM -0400, Kenneth Ho wrote:
> The latest patch posted on this mailing list, against 2.4.21-ac4, 
> doesn't work on my Thinkpad X20.
> 
> The CPU is a Speedstep capable P3@600MHz, whose clockspeed varies from 
> 260 to 600 depending on BIOS settings and AC power (as reported during 
> testing with speedstep-detect and bootup). speedstep-detect also catches 
> a single bit GPO change when switching from AC to battery on boot, with 
> BIOS settings at automatic defaults.
> 
> GPOs changes from 0x767bbfe to 0x767fbbff after disconnecting the AC. 
> This should be gpo_hilo=0.
> 
> Calling modprobe speedstep-piix4 gpo_hilo=0 leaves dmesg saying cpufreq: 
> changed failed.
> 
> Using the old speedstep_bx module on poupinou with gpo_hilo=0 yields the 
> following (success) output on dmesg:
> gpo_hilo: 0x34
> gpo_hilo_shift: 0x0
> frequency_high: 600000
> frequency_low: 500000
> 

Could you please send me the dmesg output, with SPEEDSTEP_DEBUG enabled both
in speedstep-piix4.c and speedstep-lib.c please?

Also, I would be happy to see the output of speedtep-detect

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
