From: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: Sun, 08 Jan 2006 03:32:07 +0100
Message-ID: <dpptid$3m2$1@sea.gmane.org>
References: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
	<20060103162946.GF13887@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Bruno Ducrot wrote:
> I'm wondering if this would have some more power saving if there are more
> low p-states.  I should some day look at this more seriously.

Ok, I just took some time to view a live concert DVD instead of studying or
coding... ;)

Well, as I result of that I changed my mind and must say: it might. At least
for saving a bit power during video decoding. I currently cannot imagine
different processing needs which require more processing power than
available at 1,0GHz and less than maximum, but there might be.

Video decoding at least needs much more processor cycles than I anticipated,
altought this DVD probably was pretty much the worst-case DVD one can
currently think of - rapid cuts, flashing lights, much movement and
interlaced video... :-/

Including deinterlacing and q2 or q3 pp filter postprocessing xine used
about 70% processing time at 1,0GHz averaged over a second (I didn't do
precise logging but just watched gkrellm with half an eye... ;); but very
"chunky" with lots of short peaks. Obviously xine doesn't use the
opportunity of available processing power to decode frames in advance and
even that out a bit, at least that was my impression.

There where some scenes where ondemand actually switched the CPU to 1,8GHz
and there where quite a few a fraction-of-a-second-peaks which seemed to be
too short for a speed transition but where the decoder would obviously have
needed a bit additional performance.

And I imagine that if even a DVD sometimes needs a bit more performance than
1,0GHz at my CPU can deliver, high-res xvid like videos will do as well,
probably even worse. 1,8 GHz would still be too much, so using faster low
states sounds reasonable for these tasks.

I did some basic energy consumption measurements when playing around with my
clock speeds last week, I just attached my whole computer to an el-cheapo
wattmeter.

Running at standard voltages the system running at 1,0GHz@1,1V needed 5
watts less compared to 1,8GHz@1,4V if idle and about 25 watts less if
loaded.

However, running at my lower voltages there where (only) 2 watts difference
when idle and about 12 watts under load.

In both cases I used burnK7 to load the system as it caused higher power
consumption than piping /dev/zero through gzip to /dev/null.

Now the question is if anyone considers these differences sufficiently
significant to invest time into tweaking the pnk8 driver... :-)

Greetings,

  Gunter

--=20
A nerd is someone whose life revolves around computers and technology.=20
A geek is someone whose life revolves around computers and technology,=20
and likes it!!
*** PGP-Verschl=FCsselung bei eMails erw=FCnscht :-) *** PGP: 0x1128F25F ***
