From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [powernow-k7] [dirty patch] introducing quirk_broken_bios. NEED
	TESTING
Date: Wed, 24 Mar 2004 17:28:29 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040324162829.GE19001@poupinou.org>
References: <20040324143934.GC19001@poupinou.org>
	<20040324161355.GA8572@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040324161355.GA8572@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Wed, Mar 24, 2004 at 05:13:55PM +0100, Dominik Brodowski wrote:
> On Wed, Mar 24, 2004 at 03:39:34PM +0100, Bruno Ducrot wrote:
> > You have to do something like that:
> > modprobe powernow-k7 quirk_broken_bios=1
> 
> For the future: what about a dmi flag? For 2.7., the dmi decoding should be
> done per-driver instead of one fixed location, by the way...
> 

That's exactly the reason why the subject contains "dirty patch" ;)


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
