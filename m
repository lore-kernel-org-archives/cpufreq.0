From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: problems with longhaul cpufreq driver.
Date: Mon, 8 Dec 2003 20:38:52 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031208193852.GA23953@poupinou.org>
References: <20031208162600.mgillespie@Plus.Net>
	<1070901543.27939.103.camel@ashley>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1070901543.27939.103.camel@ashley>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashley Pittman <ashley@pittman.co.uk>
Cc: mgillespie@mgillespie.plus.com, cpufreq <cpufreq@www.linux.org.uk>

On Mon, Dec 08, 2003 at 04:39:03PM +0000, Ashley Pittman wrote:
> On Mon, 2003-12-08 at 16:26, mgillespie@mgillespie.plus.com wrote:
> 
> > If I check the dmesg log, I see the following on startup: 
> > 
> > longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v2 supported. 
> > longhaul: MinMult=5.0x MaxMult=6.0x 
> > longhaul: FSB: 0MHz Lowestspeed=0MHz Highestspeed=0MHz 
> > longhaul: FSB:0 Mult:10.0x 
> 
> The problem here is the FSB is being reported as 0, this is wrong.
> 
> > Anyone else got this problem? 
> 
> I had a very similar problem with my c3 using a 2.6 kernel, I posted a
> patch to this list a while ago that, whilst incorrect in some ways is
> probably enough to allow the module to work.  There was a discussion
> about a better way to do it but I don't think that anything has been
> committed yet.
> 

Ashley:

I don't know if you refer to:

http://linux-dj.bkbits.net:8080/cpufreq/cset@1.1349.1.5?nav=index.html|ChangeSet@-3w

If yes, then that bit is probably not in cvs 2.4, nor in any
linux-2.6 mainstream (I guess).


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
