From: "Grover, Andrew" <andrew.grover@intel.com>
Subject: power measurement
Date: Thu, 23 Oct 2003 12:48:23 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <F760B14C9561B941B89469F59BA3A8470255EF6D@orsmsx401.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Todd Poynor <tpoynor@mvista.com>, arjanv@redhat.com
Cc: linux-acpilinux-acpi@intel.com, cpufreq@www.linux.org.uk, "Pallipadi,
	Venkatesh" <venkatesh.pallipadi@intel.com>

> [mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Todd Poynor
> Amps consumed should be a good predictor of expected battery life,=20
> independent of the vagaries of any particular battery.  The expensive=20
> scopemeter used for the attached measurements isn't really=20
> necessary, by=20
> the way; a $130 multimeter that averages DC amps, placed in series=20
> between the DC transformer and the notebook, should do fine.  In case=20
> this helps,

Can we all get into the habit of reporting power numbers in Watts? Just
take the amps and multiply by the voltage. This lets one better compare
platforms with differing supply voltages.

Please also make sure you have enabled ACPI processor C states. This
will help to lower idle CPU power in whatever performance state you are
in.

Regards -- Andy
