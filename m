From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: speedstep-smi into -ac ?
Date: Mon, 8 Sep 2003 10:32:55 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030908083255.GJ408@poupinou.org>
References: <87ekywzjvm.wl%miura@da-cha.org> <20030904232555.GA8650@brodo.de>
	<87bru0yutb.wl%miura@da-cha.org> <20030905065433.GC4003@brodo.de>
	<20030905084645.GO4401@poupinou.org>
	<20030907185503.GB21291@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030907185503.GB21291@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: Hiroshi Miura <miura@da-cha.org>, "'cpufreq@www linux org uk'" <cpufreq@www.linux.org.uk>

On Sun, Sep 07, 2003 at 08:55:03PM +0200, Dominik Brodowski wrote:
> On Fri, Sep 05, 2003 at 10:46:45AM +0200, Ducrot Bruno wrote:
> > Warn: I have not implemented the .resume callback.  It need to
> > be done correctly in core at first, and it seems to be not so
> > well designed at first read (at core, not in the driver).
> 
> Why?
> 

There is no restore like stuff in 2.4 backport, nor in ac (or
I'm blind).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
