From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Best CPU and Chipset for cpufreq?
Date: Thu, 15 Jan 2004 17:27:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040115162739.GU14031@poupinou.org>
References: <20040114163958.GB1774@acheron.the-domination.com>
	<1074100688.4376.12.camel@firebird.medicina.ub.es>
	<20040114192225.GA2489@acheron.the-domination.com>
	<20040114204934.GA18333@piout.net>
	<20040114215400.GA2625@acheron.the-domination.com>
	<20040114221840.GA16987@piout.net>
	<20040114224238.GB2625@acheron.the-domination.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040114224238.GB2625@acheron.the-domination.com>
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: Ducrot Bruno <ducrot@poupinou.org>

On Wed, Jan 14, 2004 at 11:42:38PM +0100, Jesper Anderson wrote:
> And to keep that part (graphics) on topic, it seems the new NVidia
> graphics cards for laptops scale their voltage. That might be
> something that we'll end up needing a driver for. Interesting
> technology, for sure.

Graphics cards for mobile do that for ages.  Just that most of time
constructors do not give specs for doing so.  AFAIK, the radeon
code in the fb does it (at least in benh tree), and there are
some experimental codes for in DRI CVS.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
