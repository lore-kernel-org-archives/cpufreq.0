From: David Kar-Fai Tam <tamda@eecg.toronto.edu>
Subject: Re: Dynamic frequency governor
Date: Tue, 21 Oct 2003 18:21:37 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0310211744210.27611-100000@cat.eecg.toronto.edu>
References: <20031021203122.GC871@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031021203122.GC871@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Tue, 21 Oct 2003, Dave Jones wrote:
> On Mon, Oct 20, 2003 at 10:08:17AM -0700, Moore, Robert wrote:
>  > Can you be more specific about who has patents on what?
> 
> http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=/netahtml/srchnum.htm&r=1&f=G&l=50&s1=6,298,448.WKU.&OS=PN/6,298,448&RS=PN/6,298,448
> Is a good place to start.  Skimming through the references there brings
> up further patents by just about everyone under the sun, including
> Intel.

Here's an idea:

I did a quick text search on the website of the above address and I 
couldn't find "voltage" mentioned anywhere. That is, I couldn't find any 
mention of dynamic "voltage" scaling as a technique for saving power.
They only talk about is using the technique of "frequency" scaling to 
save power.

With DVS algorithms, we are attempting to dynamically change the voltage 
to save power. The fact that the frequency varies is just a side effect.

How's that for finding a loop hole? =)

I don't want to get into a long discussion about whether frequency scaling
alone can save you energy. I think that we are ultimately trying to vary
the voltage because only that can really save you energy (quadratically). 
Maybe we should have named it the CPUVolt API?

--
David Tam
tamda@eecg.toronto.edu
