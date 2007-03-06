From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE
Date: Tue, 6 Mar 2007 09:24:31 -0800
Message-ID: <653FFBB4508B9042B5D43DC9E18836F50E3DFF@scsmsx415.amr.corp.intel.com>
References: <20070306161622.GJ4168@tatooine.rebelbase.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070306161622.GJ4168@tatooine.rebelbase.local>
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
Content-Type: text/plain; charset="us-ascii"
To: markus reichelt <ml@mareichelt.de>, cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>markus reichelt
>Sent: Tuesday, March 06, 2007 8:16 AM
>To: cpufreq@lists.linux.org.uk
>Subject: CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE
>
>Hi,
>
>I'm running 2.6.21-rc1 and during make menuconfig I was wondering...
>
>What's the roadmap of this? Will it be dropped and speedstep made
>rely solely on ACPI?
>
>I'm asking because I'd very much like to see it stay - I'm using
>tables to underclock my Banias CPU down to 400/200/100 MHz. No idea
>how that could be done without tables.
>

Long term view is, on any platform with ACPI support, cpufreq is handled
by acpi-cpufreq driver.
Speedstep-centrino will continue to exist in its table based format and
will not depend on ACPI and can be used on systems that do not have ACPI
support or want to use table based scheme.

Thanks,
Venki
