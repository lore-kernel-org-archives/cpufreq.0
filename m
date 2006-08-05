From: "Tobias Bocanegra" <tobias.bocanegra@day.com>
Subject: Re: Pentium D 915 / e-c1 with acpi-cpufreq
Date: Sat, 5 Aug 2006 20:49:19 +0200
Message-ID: <8be731880608051149p29bb4e51n55932a965d136148@mail.gmail.com>
References: <1154718872.8243.7.camel@skylla.slagter.name>
Reply-To: tobias.bocanegra@day.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154718872.8243.7.camel@skylla.slagter.name>
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

hmm, i have a dual core t2600 and it shows:

$ cat /proc/acpi/processor/CPU1/power
active state:            C2
max_cstate:              C8
bus master activity:     00000000
states:
    C1:                  type[C1] promotion[C2] demotion[--]
latency[000] usage[00000010]
   *C2:                  type[C2] promotion[--] demotion[C1]
latency[001] usage[02220984]

i used http://processorfinder.intel.com/default.aspx to find the spec
of my cpu: http://processorfinder.intel.com/details.aspx?sSpec=SL8VN
and reviewed the specs of my processor. and it seems, that the
power-states in acpi do not correspond to the states in the manual. i
guess C2 is the 'C1' in the spec, since there is no C0. what i don't
understand is, that it says: max_cstate: C8, which my cpu does not
have.

is there a good primer about power-states, performance levels, etc ?
regards, toby




On 8/4/06, Erik Slagter <erik@slagter.name> wrote:
> Is it normal that $(cat /proc/acpi/processor/CPU1) shows this:
>
>    *C1:                  type[C1] promotion[--] demotion[--]
> latency[000] usage[00000000] duration[00000000000000000000]
>
> I can understand the promotion, demotion and latency fields are zero,
> because they probably have no meaning without other C states.
>
> But what I don't understand is why the "usage" counter remains at zero.
> My laptop (with 4 C states) does indeed count the C1 state usage
> (although it's improbably low).
>
> Of course I'd like to see how much the C1E state is involved. If I
> understand correctly C1(E) state is achieved by simply issuing hlt.
>
> I have several other "strange" things with my cpu/motherboard/cpufreq,
> but I need to experiment more to pinpoint them.
>
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
