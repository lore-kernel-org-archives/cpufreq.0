From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: OnDemand governor vs. work queue
Date: Wed, 25 May 2005 14:34:15 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6004D3529A@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Benjamin Herrenschmidt
>Sent: Wednesday, May 25, 2005 2:27 PM
>To: Bruno Ducrot
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: OnDemand governor vs. work queue
>
>On Wed, 2005-05-25 at 11:59 +0200, Bruno Ducrot wrote:
>> On Wed, May 25, 2005 at 01:26:40PM +1000, Benjamin=20
>Herrenschmidt wrote:
>> > Hi !
>> >=20
>> > >From what I've seen, the OnDemand governor works using a=20
>timer/workqueue
>> > pair.
>> >=20
>> > That annoys me a bit as the setup I have on PowerMacs can=20
>take several
>> > ms to transition (due to voltage transition mostly). I=20
>don't like the
>> > idea of hogging keventd that long.
>> >=20
>> > Wouldn't it make sense, especially for setups where=20
>transition latency
>> > is high (by high, I mean significant compared to HZ for=20
>example), to
>> > actually spawn a kthread and do the sampling & switching=20
>from there ?
>>=20
>> I'm wondering if in that case a userspace daemon will be=20
>more suited..
>
>This is what I do & recommend for powerbook users (so far, powernowd
>works like a charm), but since OnDemand governor advertises=20
>working with
>latencies as big as 10ms, I was wondering ...
>
>Ben.
>

Agreed. For the larger latency transitions, ondemand governor should=20
use its own thread rather than keventd. Probably, it may make sense to=20
have separate threads for each CPU as well in that case (as otherwise=20
this thread will end up being moved around from one CPU to other. I will

look at this in a couple of weeks unless someone beats me to it and=20
sends the patch before that :).

Thanks,
Venki
