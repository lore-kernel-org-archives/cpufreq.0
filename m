From: st3@riseup.net
Subject: Re: speedstep-centrino on dothan
Date: Thu, 7 Jul 2005 23:59:28 +0200
Message-ID: <20050707235928.71016f61@horst.morte.male>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <42CC37FD.5040708@tmr.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>, linux-kernel@vger.kernel.org
Cc: cpufreq@lists.linux.org.uk

On Wed, 06 Jul 2005 15:58:53 -0400
Bill Davidsen <davidsen@tmr.com> wrote:

> st3@riseup.net wrote:

[snip]

> > Moreover, I checked on Pentium M 725 and Pentium M 715 that the lowest
> > frequency at which the CPU can be set safely is not the 600MHz given in
> > datasheets, but 400MHz instead, with VID#A, VID#B, VID#C and VID#D (see
> > datasheet for more details) set to 0.908V.
> > 
> > I can provide a patch, let me know.
> 
> Slower is better

[snip]

Here's a quick trick for getting CPU to lower frequencies than the ones
read from ACPI tables, while still keeping them available.

Just add these lines in centrino_cpu_init_acpi(), in speedstep-centrino.c,
just after (and outside) the first 'for' cycle like this:
for (i=0; i<p.state_count; i++) { ...

centrino_model[cpu]->op_points[p.state_count - 1].index = 0x040D;
centrino_model[cpu]->op_points[p.state_count - 1].frequency = 400000;
p.states[p.state_count - 1].core_frequency = 400;

This will enable 400MHz at 908mV, which I found to be useful on Dothan
CPUs. If you want to get values for other frequencies/voltages, just use
something like:

#include <stdio.h>

int main() {
unsigned int index, frequency, voltage

index = (((frequency)/100) << 8) | ((voltage - 700) / 16);
printf ("%u\n", index);
}

frequency is expressed in MHz, voltage in mV, index is the value for
centrino_model[cpu]->op_points[y].index <- remember to change this y if you
want to add multiple frequencies besides the ACPI ones; for example, if you
want 500MHz at 940mV, you could add:

centrino_model[cpu]->op_points[p.state_count - 2].index = 0x1295;
centrino_model[cpu]->op_points[p.state_count - 2].index = 500000;
p.states[p.state_count - 2].core_frequency = 500;

Sorry if I have been off-topic.


--
ciao
st3
