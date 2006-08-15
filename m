From: "Guilherme Moro" <guilherme.moro@ltia.fc.unesp.br>
Subject: RE: Main differences between drivers
Date: Tue, 15 Aug 2006 15:44:26 -0300
Message-ID: <59a2a3420608151144t412a6d36i5350b4db8a13b9cb@mail.gmail.com>
References: <44e21561.2170fc78.5877.7d17SMTPIN_ADDED@mx.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44e21561.2170fc78.5877.7d17SMTPIN_ADDED@mx.gmail.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hello again

Another question, this 2 drivers can, theorically, cover all kind of Intel
based hardware?
If I build my own, all new, platform, will I need to write a new driver?
Will emerge any situation to write a new driver, thinking that I will always
use Intel processors, compatibles with Enhanced SpeedStep?

Guilherme Moro

> -----Mensagem original-----
> De: Len Brown [mailto:len.brown@intel.com]
> Enviada em: Tuesday, August 15, 2006 11:57 AM
> Para: cpufreq@lists.linux.org.uk
> Cc: Guilherme Moro
> Assunto: Re: Main differences between drivers
>
> On Tuesday 15 August 2006 10:22, Guilherme Moro wrote:
> > Hello all,
> >
> > Can someone explain, or send a link or a document that explain the
> > real difference between the different drivers for Intel processors ?
> > Why the same processor can use speedstep-ich, speedstep-centrino and
> > acpi-cpufreq ?
> > the basic differences I can understand, like acpi-cpufreq use of acpi
> > tables, but what driver is the "better" or more "official" for Intel
> > platforms?
>
> good question -- the names are quite poor, and unfortunately
> it is a pain to re-name drivers.
>
> As of 2.6.17, both acpi-cpufreq and speedstep-centrino
> use ACPI tables, but acpi-cpufreq uses IO accesses
> and speedstep centrino uses MSR accesses.
> Since MSR accesses are faster,
> it is preferred to try speedstep-centrino first.
>
> speedstep centrino also has reverse engineered tables to fall back on
> if ACPI tables fail.  I haven't seen this happen in practice in recent
> history.
> The hard-coded tables were there from before Intel published the PDC
> bits that allow ACPI tables to work with MSR accesses.
>
> Going forward, there has been a set of patches on the list to:
> 1. add MSR access to acpi-cpufreq
> 2. remove ACPI tables from speedstep-centrino.
>
> That would mean that acpi-cpufreq can handle any ACPI situation --
> IO or MSR; and that speedstep-centrino would be only for the reverse-
> engineered case.
> Thus the preference would change to be acpi-cpufreq first, speedstep-
> centrino second --
> though the reverse preference would probably be okay too.
>
> -Len
>
> ps. don't bother with speedstep-ich if the above work, and never use p4-
> clockmod.
>
>
> --
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.1.405 / Virus Database: 268.10.10/419 - Release Date: 8/15/2006
>

--
No virus found in this outgoing message.
Checked by AVG Free Edition.
Version: 7.1.405 / Virus Database: 268.10.10/419 - Release Date: 8/15/2006


--
No virus found in this outgoing message.
Checked by AVG Free Edition.
Version: 7.1.405 / Virus Database: 268.10.10/419 - Release Date: 8/15/2006




-- 
Guilherme Moro
