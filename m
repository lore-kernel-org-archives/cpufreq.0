From: Jesper Anderson <jesper@pobox.com>
Subject: Re: Pentium III Coppermine and 440BX/ZX/DX
Date: Tue, 17 Feb 2004 12:32:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040217113215.GA11848@acheron.utfors.se>
References: <20040217005504.GA809@acheron.utfors.se>
	<20040217095411.GV13262@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040217095411.GV13262@poupinou.org>
Resent-To: cpufreq@www.linux.org.uk
Resent-Message-Id: <20040217113422.8B4635A4A4@www.pobox.com>
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
To: Bruno Ducrot <ducrot@poupinou.org>

On Tue, Feb 17, 2004 at 10:54:11AM +0100, Bruno Ducrot wrote:
> 
> There is good chance that it work, but I think that you need to pass the
> smi_cmd=0x82 to speedstep-smi:
> 
> modprobe speedstep-smi smi_cmd=0x82

Thanks. Hmm. I tried that, and the exact same thing happened; ie.
nothing. I looked manually for the cpufreq interface in /sys and
/proc, and couldn't find anything. cpufreqd 1.1.1 can't find it
either.

Jesper
