From: aeriksson@fastmail.fm
Subject: Re: Pentium III Coppermine and 440BX/ZX/DX
Date: Tue, 17 Feb 2004 06:14:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040217051453.31A6B3F04@latitude.mynet.no-ip.org>
References: <jesper@pobox.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Message from Jesper Anderson <jesper@pobox.com> of "Tue,
	17 Feb 2004 01:55:04 +0100." <20040217005504.GA809@acheron.utfors.se> 
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



jesper@pobox.com said:
> Unfortunately I'm a bit unclear on just what I need to do to get
> cpufreq running on this system. I tried modprobing speedstep-smi
> (from kernel 2.6.2 with mm1), and it gives no errors - but neither
> does it give me anything to go on in /sys or /proc. speedstep-ich
> doesn't load at all. I tried the patch posted previously on the
> mailing list (that removes a few bits of the PIII check), but that
> didn't make any difference. 


Intersting... I'd suggest enabling the debug options and sprinkle some
printk's in the detection code to see where it decides that your
machine is not speedstep capable. I was thinking of cooking up a patch
for ancient speedstep which was controlled by a kernel option.
Apparently, it should be different from the previous patch...

Keep us posted.
/A
