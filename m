From: "Wayne Wylupski" <wayne@connact.com>
Subject: Re: userspace not supported for longrun?
Date: Tue, 1 Jun 2004 19:52:05 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <005701c44833$71e8ca30$6900a8c0@DEVELOPER>
References: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
	<20040601093110.GE7926@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

> It's by choice.  Even though there exist some algo. for which it's seems
> there are better choice over the longrun facilities in order to switch
> automatically the frequency of the processor, it's hard to get those
> algo. to mainline mostly due to some kind of patent issues
> apparently.  So for now the longrun driver do not have the facilities to
> make what you request.  Would be fine perhaps to add that, but I'm
> not sure it's in a high priority item for now.

Thank you.  The issue is that Fedora Core 2 ships with 'cpuspeed' as a
service, which fails on machines with Crusoe chips because it assumes
there's a userspace governor without first checking whether there it is
available.

Would it really violate patents if the userspace governor were allowed
to work along the existing policies ("powersave" and "performance")?  Or is
it that
the use of 'cpuspeed' might violate the patent?  Please help me understand
this,
because I'm going to try to recommend how FC2 should support Crusoe and
processors with longrun support.

If there's an existing e-mail, memo, or document which explains this, I
would be
read and work with it.  The existing documentation does not cover this.

Thanks,
Wayne Wylupsxki
