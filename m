From: Ivor Hewitt <ivor@ivor.org>
Subject: Re: Kernel 2.6.7 speedstep-piix4 on vaio
Date: Fri, 30 Jul 2004 20:20:49 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200407302020.50451.ivor@ivor.org>
References: <43210.141.228.156.225.1091110800.squirrel@141.228.156.225>
	<20040729210413.GA7782@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040729210413.GA7782@dominikbrodowski.de>
Content-Disposition: inline
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

On Thursday 29 July 2004 21:04, Dominik Brodowski wrote:
> On Thu, Jul 29, 2004 at 03:20:00PM +0100, Ivor Hewitt wrote:
>
> Therefore, the speedstep-smi driver contains a few tweaks which modify the
> "language" a bit: have you tried passing the module options
> "smi_port=0xb2 smi_cmd=0x82" yet? On several systems, the smi_cmd is set
> wrongly by default.
>
Aha, with the right combination of BIOS settings and the smi_cmd=0x82 setting 
the smi driver works on the Vaio Z600.

Had to set BIOS settings as:-
PnP OS: No
CPU OS Control: Auto
CPU Speed: Auto

Many thanks,

-- 
Ivor Hewitt.
http://www.ivor.it - tech | http://www.ivor.org - hedge
