From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: found unsupported CPU with Enhanced SpeedStep
Date: Thu, 6 Jan 2005 11:00:58 +0100
Message-ID: <20050106100058.GL19199@poupinou.org>
References: <20041230014005.GA16358@bittwiddlers.com>
	<1104446294.24179.1.camel@localhost>
	<20050102120729.GB23300@dominikbrodowski.de>
	<20050105160622.GE19199@poupinou.org>
	<20050105162234.GA18703@bittwiddlers.com>
	<20050105172415.GH19199@poupinou.org>
	<20050105180232.GA29313@bittwiddlers.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050105180232.GA29313@bittwiddlers.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Harrell <mharrell-dated-1105380155.576c74@bittwiddlers.com>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Wed, Jan 05, 2005 at 01:02:32PM -0500, Matthew Harrell wrote:
> : There is four Load statements in the ssdt.  I need to look what tables 
> : are loaded at run time.
> : 
> : Could you please send to me the result of the attached program
> : when HT mode?
> 
> Well, I ran it as root both with HT turned on and off.  Both times I got this
> 
>         CPU0IST  3ffefbe7 277
>         can't decode CPU0IST
>         CPU1IST  3ffefb60 87
>         can't decode CPU1IST
>         CPU0CST  3ffef988 1d8
>         can't decode CPU0IST
>         CPU1CST  3ffef92c 5c
>         can't decode CPU1IST

Well... Originally (before sending you this prog) the latest entry was
        {
                .name = "CPU1CST ",
                .address = 0x40fdd50,
                .len = 100
        },
in order to chekc it worked.

I've taken care that 0x040fd800 is correctly somewhere at the ACPI table:

ducrot@poup$ cat /proc/iomem 
00000000-0009f7ff : System RAM
0009f800-0009ffff : reserved
000a0000-000bffff : Video RAM area
000c9000-000c97ff : Extension ROM
000e0000-000effff : Extension ROM
000f0000-000fffff : System ROM
00100000-040fd7ff : System RAM
  00100000-002aa884 : Kernel code
  002aa885-0035bebf : Kernel data
040fd800-040ff7ff : ACPI Tables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     Here...

040ff800-040ffbff : ACPI Non-volatile Storage
040ffc00-0fffffff : System RAM
f4000000-f400007f : 0000:00:0e.0
f5000000-f5ffffff : PCI Bus #01
  f5000000-f5ffffff : 0000:01:00.0
f8000000-fbffffff : 0000:00:00.0
fc000000-fdffffff : PCI Bus #01
  fc000000-fdffffff : 0000:01:00.0
fff80000-ffffffff : reserved

and this worked:
CPU0IST  3ffefbe7 277
can't decode CPU0IST 
CPU1IST  3ffefb60 87
can't decode CPU1IST 
CPU0CST  3ffef988 1d8
can't decode CPU0CST 
CPU1CST  40fdd50 64

040fdd50: 04 5f 53 42 5f 50 43 49 30 49 53 41 5f 4c 4e 4b 
040fdd60: 44 0a 00 12 1e 04 0c ff ff 0e 00 0a 03 5c 2f 04 
040fdd70: 5f 53 42 5f 50 43 49 30 49 53 41 5f 4c 4e 4b 41 
040fdd80: 0a 00 12 1e 04 0c ff ff 0f 00 0a 00 5c 2f 04 5f 
040fdd90: 53 42 5f 50 43 49 30 49 53 41 5f 4c 4e 4b 43 0a 
040fdda0: 00 12 1e 04 0c ff ff 0f 00 0a 01 5c 2f 04 5f 53 
040fddb0: 42 5f 50 43 

so I must admit I'm puzzled.

> Some other comments about HT mode.  About 50% of the time when HT is turned on
> the bootup sequence will oops and hang somewhere.  I don't know how to get the
> output from the oops since it never gets to a single user shell.  The rest of
> the time it will boot up fine and work in SMP mode.  The frequency scaling
> seems to work fine but I get a lot of these messages in my log
> 
>         acpi-cpufreq: Transition failed
>
> I don't seem to get those when not running with HT on.
> 
> Let me know if there is a different program I can run to get those tables

BTW, its not related, but there is 1Go ram.  You should enable highmem in
order to get an extra 128Mo.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
