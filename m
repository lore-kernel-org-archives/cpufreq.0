From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep and deep sleep on celeron-M
Date: Sat, 18 Sep 2004 23:58:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040918215839.GA7717@dominikbrodowski.de>
References: <414BF01D.4000905@altern.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <414BF01D.4000905@altern.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Couronne <xof@altern.org>
Cc: cpufreq@www.linux.org.uk

Hi,

> I've just bought a new laptop based on a celeron-M processor (an
> IBM thinkpad R51). According to intel, this family of processor doesn't
> support speedstep, which is replaced by another technology called "deep
> sleep".

Uh? SpeedStep replaced by "Deep Sleep"? Where did you find that, ehm, joke? 

> I would like to know if the speedstep functionnality can be enabled
> anyway. The celeron-M processor seems to be based on a pentium-M banias
> (same family, same model id, same stepping)

... but with SpeedStep support not present in the CPU, AFAIK. So there's no
way to enable celeron-M.

> and the p4-clockmod module can be loaded (but not the speedstep-centrino).
... which only offers frequency modulation instead of frequency scaling, so
it will only save you minimal amounts of battery power. There should be a
warning (in dmesg) when loading the p4-clockmod module which informs of 
this fact.

> The problem is that the scaling_governor is set to "performance" and
> can't be changed, so the processor always runs at his max frequency.

you can only change the CPUfreq governor if more than one is loaded. You can
see which ones are loaded in scaling_available_governors; and you can load,
for example, the module "cpufreq_userspace" in case you built the userspace
cpufreq governor as module.

> Is there people which have succeeded to enable power management (deep
> sleep or speedstep) on a Celeron-M based laptop? 

Deep Sleep might be supported (depending on the BIOS in your notebook) by
the ACPI processor subsystem. It's a form of "idling" which is enabled when
the CPU has nothing to do, and may be C-State 3. For more information on
that, check the current ACPI processor information at http://acpi.sf.net;
also bug #1958 at bugzilla.kernel.org may be of interest as it can enable
more C-States. However, it depends on the BIOS which CPU Power State (Deep
Sleep is one of them) is enabled as what C-State. It has nothing to do with
CPUfreq, though.

	Dominik
