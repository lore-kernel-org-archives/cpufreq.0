From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Can't get it working on Mobile Coppermine 1Ghz - i440BX -
	please help...
Date: Wed, 13 Sep 2006 19:01:22 +0200
Message-ID: <20060913170121.GJ4945@poupinou.org>
References: <20060913103738.9984.qmail@web30803.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060913103738.9984.qmail@web30803.mail.mud.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johny the Ripper <my_publicyty@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

On Wed, Sep 13, 2006 at 03:37:38AM -0700, Johny the Ripper wrote:
> I started a thread on the gentoo forums, but I didn't
> get a reply... I hope you guys can help me out, I
> searched the internet and forums a lot, don't know why
> it isn't working... Here's the gentoo thread:
> 
> http://forums.gentoo.org/viewtopic-t-497427.html
> 
> If you have a clue of where I could begin to continue
> to search, please post it...
> 

http://www.poupinou.org/cpufreq/

Perhaps doing something like that:

modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
will help resolve that issue?

If that don't work, please provide output from speedstep-detect
that can be found here:
ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
