From: "Tobias Bocanegra" <tobias.bocanegra@day.com>
Subject: Re: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Sun, 6 Aug 2006 11:44:15 +0200
Message-ID: <8be731880608060244t3c0cedd6k7c7f76d5a58f8489@mail.gmail.com>
References: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
	<44D28043.5010301@goop.org>
	<8be731880608051042o6d9a3eb6v2b7290fcd9eaf866@mail.gmail.com>
	<44D59CC5.1010200@goop.org>
	<8be731880608060209s7b280ecvadffc9c28c9d770d@mail.gmail.com>
	<1154856741.8243.21.camel@skylla.slagter.name>
Reply-To: tobias.bocanegra@day.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154856741.8243.21.camel@skylla.slagter.name>
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

well, that's exactly what's not working. the cpufreq-set does not
work, because of the perflib (my guess). and the echo 0 > performance
does not change the state.

On 8/6/06, Erik Slagter <erik@slagter.name> wrote:
> On zo, 2006-08-06 at 11:09 +0200, Tobias Bocanegra wrote:
> > i think it's the perflib:
> >
> > $ cat /proc/acpi/processor/CPU0/performance
> > state count:             4
> > active state:            P1
> > states:
> >     P0:                  2167 MHz, 31000 mW, 10 uS
> >    *P1:                  1667 MHz, 23000 mW, 10 uS
> >     P2:                  1333 MHz, 18000 mW, 10 uS
> >     P3:                  1000 MHz, 13000 mW, 10 uS
> >
> > how is the performance state set / influenced?
> > regards, toby
>
> You can do a "echo 0 > performance" to make the processor go to P0 etc.
> But this is a deprecated interface. You should use cpufreq-set I guess.
>
>
>


-- 
-----------------------------------------< tobias.bocanegra@day.com >---
Tobias Bocanegra, Day Management AG, Barfuesserplatz 6, CH - 4001 Basel
T +41 61 226 98 98, F +41 61 226 98 97
-----------------------------------------------< http://www.day.com >---
