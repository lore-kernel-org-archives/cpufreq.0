From: "Ivor Hewitt" <ivor@ivor.org>
Subject: Kernel 2.6.7 speedstep-piix4 on vaio
Date: Thu, 29 Jul 2004 15:20:00 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <43210.141.228.156.225.1091110800.squirrel@141.228.156.225>
Reply-To: ivor@ivor.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

Firstly should the speedstep-smi driver be able to work on a Vaio Z600TEK
(Coppermine P3, 440BX chipset)? I can only get speedstep to work on 2.6 by
using the old piix4 code. Has anyone else got speedstep going on one of these?

For me the speedstep-smi driver fails on this machine with the error:
"could not detect low and high frequencies by SMI call"
"could not detect two different speeds -- aborting"

However, I used to have the piix4 driver working on this machine, but this is
not in the 2.6 kernel tree.

So... I updated the old copy of the piix4 driver which used the old gpo_hilo
code to work on kernel 2.6.7. and it now works just fine for me.

The text on the www.poupinou.org site implied that the piix driver was now
obsolete due to the smi driver.

Given that I now have the piix driver working, should it be possible to make
the smi driver work? i.e. is the smi just a better way of doing the same thing
and anything that the old driver did should be possible in the new one?

I'll post my patch to get piix working against 2.6.7, when I get back to a
network connection.

Regards,
Ivor.

PS Is there a searchable archive of this list?

-- 
http://ivor.org - leylandii hedge -- http://ivor.it - technology

SquirrelMail - webmail for nuts.
