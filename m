From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq files missing in Linux 2.6.5
Date: Fri, 21 May 2004 00:57:29 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1085097449.18969.1.camel@delerium.codemonkey.org.uk>
References: <Pine.GSO.4.30.0405201547480.13318-100000@rigel.oac.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <Pine.GSO.4.30.0405201547480.13318-100000@rigel.oac.uci.edu>
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
To: Vasanth Venkatachalam <vvenkata@es.nacs.uci.edu>
Cc: cpufreq@www.linux.org.uk

On Thu, 2004-05-20 at 23:56, Vasanth Venkatachalam wrote:

> 1. The directory /sys/devices/system/cpu/cpu0 exists but is empty; there
> is no cpufreq subdirectory inside it.

Sounds like it didn't detect whatever processor you have.
What CPU is it ? cpufreq related msgs from dmesg please ?
have you tried modprobe'ing the relevant driver ?

> 2. There's also no /proc/cpufreq or /proc/sys/cpu/*/speed directory.

Thats the deprecated 2.4 interface.

	Dave
