From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: support on Ali chipset [2]
Date: Fri, 17 Oct 2003 18:12:15 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031017161215.GJ8668@poupinou.org>
References: <20031016101536.GA766@rimini.no-ip.com>
	<20031016121336.GC8668@poupinou.org>
	<20031016141621.GA6828@rimini.no-ip.com>
	<87smlsr9jd.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87smlsr9jd.wl%miura@da-cha.org>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: "'cpufreq@www linux org uk'" <cpufreq@www.linux.org.uk>

On Fri, Oct 17, 2003 at 09:29:42AM +0900, Hiroshi Miura wrote:
> Hi,
> 
> Can you try speedstep-smi driver?
> Is speedstep-smi driver usable or not?

A way to test at first is to get

ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz

It will complain it do not find a supported southbridge
but it perform a int15 and so can be used to see if
speedstep-smi may work or not.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
