From: Ashley Pittman <ashley@pittman.co.uk>
Subject: Re: problems with longhaul cpufreq driver.
Date: Mon, 08 Dec 2003 16:39:03 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1070901543.27939.103.camel@ashley>
References: <20031208162600.mgillespie@Plus.Net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031208162600.mgillespie@Plus.Net>
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
To: mgillespie@mgillespie.plus.com
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Mon, 2003-12-08 at 16:26, mgillespie@mgillespie.plus.com wrote:

> If I check the dmesg log, I see the following on startup: 
> 
> longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v2 supported. 
> longhaul: MinMult=5.0x MaxMult=6.0x 
> longhaul: FSB: 0MHz Lowestspeed=0MHz Highestspeed=0MHz 
> longhaul: FSB:0 Mult:10.0x 

The problem here is the FSB is being reported as 0, this is wrong.

> Anyone else got this problem? 

I had a very similar problem with my c3 using a 2.6 kernel, I posted a
patch to this list a while ago that, whilst incorrect in some ways is
probably enough to allow the module to work.  There was a discussion
about a better way to do it but I don't think that anything has been
committed yet.

I would be interested to know if the patch works for you.

Ashley,
