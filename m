From: GoatZilla <goatzilla@gmail.com>
Subject: Manual PST settings for "unrecognized CPUs"
Date: Mon, 16 Aug 2004 19:13:18 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <39e3484804081616133c2765ce@mail.gmail.com>
Reply-To: GoatZilla <goatzilla@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

OK, I guess I'll go ahead and jump on the sword here, as I'm sure I'm
not the only one wondering this.

I have a desktop Duron that I've closed off the L5 mobile bridge on,
and unlocked two L6 bridges so I can set the SoftFID back up to at
least startup value.  My intent is actually to underclock the CPU to
reduce power/heat.

I've tested the changes with Windows and CPUMSR, and it works really
well, aside from my inability to change the SoftVID due to lack of
motherboard support.  Oh, I'm using a regular desktop motherboard.

Anyways, now I'd like to attempt the same thing with Linux.  

I'm sure my configuration is going to be completely unrecognized, and
even if it was, I'm not so sure any PST's would come up.  So I guess
I'm going to have to add it in myself.

I saw a patch fly by a short while ago where a user added some
settings for an unrecognized config.  Is this the only way to hack in
a PST?
