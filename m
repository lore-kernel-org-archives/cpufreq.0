From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] speedstep-centrino: hanlde cpu p state propery when
	resume
Date: Thu, 23 Sep 2004 10:02:48 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040923080248.GA14036@dominikbrodowski.de>
References: <87acvh7e15.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87acvh7e15.wl%miura@da-cha.org>
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
Cc: cpufreq@www.linux.org.uk

On Thu, Sep 23, 2004 at 02:25:10PM +0900, Hiroshi Miura wrote:
> Hi,
> 
> My note pc, Panasonic Let's Note CF-R3(Pentium M 1.1GHz), troubles when resume.
> BIOS set cpu p-state as of ac-line state.
> Centrino driver can not detect change through suspend/resume.

Actually, it should. Only the (deprecated)
/proc/acpi/processor/*/performance interface may show a wrong current state,
/sys/devices/system/cpu/cpu0/cpufreq/{scaling,cpuinfo}_cur_freq should be
updated by doing a call to ->get().

Oh, and what suspend method are you using?

	Dominik
