From: Dominik Brodowski <linux@brodo.de>
Subject: Re: speedstep-smi into -ac ?
Date: Mon, 8 Sep 2003 11:23:17 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030908092317.GB1258@brodo.de>
References: <87ekywzjvm.wl%miura@da-cha.org> <20030904232555.GA8650@brodo.de>
	<87bru0yutb.wl%miura@da-cha.org> <20030905065433.GC4003@brodo.de>
	<20030905084645.GO4401@poupinou.org>
	<20030907185503.GB21291@brodo.de>
	<20030908083255.GJ408@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030908083255.GJ408@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: Hiroshi Miura <miura@da-cha.org>, "'cpufreq@www linux org uk'" <cpufreq@www.linux.org.uk>

On Mon, Sep 08, 2003 at 10:32:55AM +0200, Ducrot Bruno wrote:
> On Sun, Sep 07, 2003 at 08:55:03PM +0200, Dominik Brodowski wrote:
> > On Fri, Sep 05, 2003 at 10:46:45AM +0200, Ducrot Bruno wrote:
> > > Warn: I have not implemented the .resume callback.  It need to
> > > be done correctly in core at first, and it seems to be not so
> > > well designed at first read (at core, not in the driver).
> > 
> > Why?
> > 
> 
> There is no restore like stuff in 2.4 backport, nor in ac (or
> I'm blind).

Actually, I meant "why do you consider the ->resume implementation to be 'not
so well designed'"?

	Dominik
