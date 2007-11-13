From: "Uli Brueggemann" <uli.brueggemann@gmail.com>
Subject: Modprobe of cpufreq modules fails
Date: Tue, 13 Nov 2007 09:25:49 +0100
Message-ID: <10a58eee0711130025oc60f879n74c082695b8b8ee5@mail.gmail.com>
References: <10a58eee0711120143v7b82e98cncb16e9f07a9de21f@mail.gmail.com>
	<47386B86.3010306@redhat.com>
	<10a58eee0711130024u2fb6f1das29db87d0932323@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <10a58eee0711130024u2fb6f1das29db87d0932323@mail.gmail.com>
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
To: cpufreq@lists.linux.org.uk

Hi Jarod,

thanks for your answer. I start to understand a bit.

Anyway cpufreq.debug=7 leads to

cpufreq-core: trying to register driver acpi-cpufreq
cpufreq-core: adding CPU 0
cpufreq-core: initialization failed
cpufreq-core: adding CPU 1
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver acpi-cpufreq
cpufreq-core: unregistering CPU 0
cpufreq-core: unregistering CPU 1

So it seems that the mainboard (Jetway) is not the right one. I have not
found any BIOS setting which would help. Also the latest BIOS update has not
solved the problem. Why does the initialization fail? Any other reason?

So this finally leads to my question: how to detect the right mainboard/BIOS
before buying?

Uli



On Nov 12, 2007 4:04 PM, Jarod Wilson < jwilson@redhat.com> wrote:

> Uli Brueggemann wrote:
> > I'm running a Core 2 Duo system. With different kernels (up to 2.6.23.1or
> > 2.6.24-rc2) I cannot modprobe acpi_cpufreq or speedsteep-centrino or ...
> > So I always get the report "no such device".
>
> You definitely want acpi-cpufreq, not speedstep-centrino... The 'no such
> device' message usually indicates that upon querying your BIOS ACPI
> tables, acpi-cpufreq found no valid frequency scaling information, which
> suggests either freq scaling is disabled in the BIOS or your BIOS has
> busted ACPI (in which case a newer BIOS for your board, if available,
> might help).
>
> Also, you can boot with the added parameter 'cpufreq.debug=7' to get a
> bit more info spit out in dmesg about what's going on when you try to
> load acpi-cpufreq. Could give some further insight into what went wrong
> and/or verify what I suggested above.
>
> --
> Jarod Wilson
> jwilson@redhat.com
>
>
>
