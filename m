From: Wayne Wylupski <wayne@connact.com>
Subject: userspace not supported for longrun?
Date: Mon, 31 May 2004 23:40:26 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
Mime-Version: 1.0 (Apple Message framework v553)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hello,

I've been tracking down an issue with using Fedora Core 2 on a 
Transmeta Crusoe TM5800 and it appears a userspace governor is not 
supported by cpufreq (the longrun scaling driver has a .setpolicy, 
which prevents the userspace governor from being set).

Could someone please explain if this is by choice or a bug?  If it's 
the latter, could someone explain why, since the CPU itself supports 
different frequencies?

Thank you,

Wayne Wylupski
