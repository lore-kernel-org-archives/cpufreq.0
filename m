From: Dominik Brodowski <linux@brodo.de>
Subject: speedstep-smi into -ac ?
Date: Fri, 5 Sep 2003 08:54:33 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030905065433.GC4003@brodo.de>
References: <87ekywzjvm.wl%miura@da-cha.org> <20030904232555.GA8650@brodo.de>
	<87bru0yutb.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87bru0yutb.wl%miura@da-cha.org>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: "'cpufreq@www linux org uk'" <cpufreq@www.linux.org.uk>

On Fri, Sep 05, 2003 at 08:53:36AM +0900, Hiroshi Miura wrote:
> 
> At Fri, 5 Sep 2003 01:25:55 +0200,
> Dominik Brodowski wrote:
> > 
> > Actually, I much preferred the original version of your driver. This "event"
> > stuff can either be done as a seperate governor (different file), or in
> > userspace (as Bruno has pointed out).
> > 
> > What do you think about the patches for your driver I sent you?
> 
> I think your patches is better. I cannot test on 440BX/ZX, so it is needed.
> 
> My previous post is only to demonstrate event smi function and
> a sample implementation.

What do you think: is the speedstep-smi driver v1 as it is in CVS now ready
to be pushed to Alan?

	Dominik
