From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: patch doesn't apply cleanly on 2.4.22
Date: Thu, 18 Dec 2003 15:52:15 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031218145215.GH14031@poupinou.org>
References: <Law12-F12119DBqqtJ10004bf6e@hotmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Law12-F12119DBqqtJ10004bf6e@hotmail.com>
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
To: Acid Zebra <acid_zebra@hotmail.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Dec 17, 2003 at 10:10:15PM +0100, Acid Zebra wrote:
> I also can't apply the patch to 2.4.21 or 2.4.22...

What about 2.4.23?

> and 2.6.0 is not an option for me; I lose the accelerated radeon mobility 
> drivers from gatos.sf.net
> So I either have nice CPU freq. tuning or nice speedy graphics...
> I spent a whole weekend compiling kernels trying to get cpufreq working but 
> no go :(

The merge to 2.4.23 was done in 2003-12-05, so go get an earlier version
via ftp or via cvs with something like that:

cvs -z3 -d:pserver:cvs@pubcvs.arm.linux.org.uk:/mnt/src/cvsroot \
	co -rLINUX_2_4 -D '2003-12-05' cpufreq

if really you want to stick with 2.4.22.

BTW, what cpufreq driver are you using?

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
