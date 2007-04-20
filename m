From: Dave Jones <davej@redhat.com>
Subject: Re: Voltage tweaking in powernow_k8
Date: Fri, 20 Apr 2007 14:55:33 -0400
Message-ID: <20070420185533.GE13939@redhat.com>
References: <20070415171810.GA3096@thing.nowhere>
	<1449F58C868D8D4E9C72945771150BDF02076D07@SAUSEXMB1.amd.com>
	<46239583.67d3ffa6.271c.2ed5@mx.google.com>
	<1449F58C868D8D4E9C72945771150BDF02076D28@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1449F58C868D8D4E9C72945771150BDF02076D28@SAUSEXMB1.amd.com>
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
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, Apr 20, 2007 at 01:35:23PM -0500, Langsdorf, Mark wrote:

 > > It may be a good idea to print warnings when the parameter is used,
 > > to clearly state the unsupported and potentally dangerous effect of
 > > the parameter (though it would not be enough to change your view,
 > > I guess...).
 > 
 > I still wouldn't be able to support it, no.  That's out of my
 > hands.

I'm not enthusiastic about merging this code at all.
The big problem I see is that a lot of the reasons people want
to do this is "The bios say xyz, but the datasheet says it can do xyz+-1"
In many cases, the bios *really* does know best.  Board layout differences,
differences in quality of VRMs etc between vendors may mean that yes, you
can get away with tweaking things on one board, but someone else with
the "same" board may notice stability problems.
The kind of bugs that manifest with incorrectly configured frequency scaling
are nigh on impossible to track down, and as someone who sits on the
recieving end of user bugreports, I don't want to have to deal with that,
and I can't imagine other distributors would feel differently.

	Dave

-- 
http://www.codemonkey.org.uk
