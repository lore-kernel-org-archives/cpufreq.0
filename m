From: Michael Meskes <meskes@debian.org>
Subject: Re: Centrino based CPU not recognized
Date: Sat, 18 Nov 2006 18:16:01 +0100
Message-ID: <20061118171601.GA15079@feivel.credativ.de>
References: <20061118110642.GA10713@feivel.credativ.de>
	<20061118123827.GA3232@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061118123827.GA3232@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: cpufreq@lists.linux.org.uk, meskes@debian.org

On Sat, Nov 18, 2006 at 01:38:27PM +0100, Mattia Dongili wrote:
> did you tried both of acpi-cpufreq and speedstep-centrino? I have the

Yes, both give ENODEV. But I haven't debugged acpi-cpufreq as much. All
I know is that acpi_cpufreq_cpu_init is called twice with the second
call seemingly returning -ENODEV.

> same cpu working here with the former module since 2.6.19-rcX-mm while
> it worked with the latter at 2.6.1[78] times.

I read some reports that the old coreduo cpus stopped working when the
current bios was released. They seemed to work before. However, the old
bios doesn't work with core2duo's. It's an HP NX7400 in case I didn't
mention. 

Michael
-- 
Michael Meskes
Email: Michael at Fam-Meskes dot De, Michael at Meskes dot (De|Com|Net|Org)
ICQ: 179140304, AIM/Yahoo: michaelmeskes, Jabber: meskes@jabber.org
Go SF 49ers! Go Rhein Fire! Use Debian GNU/Linux! Use PostgreSQL!
