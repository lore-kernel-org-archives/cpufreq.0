From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7463] CPU frequency scaling(cpufreq) does not work.
	speedstep-centrino.c problem
Date: Wed, 28 May 2008 11:07:01 -0700 (PDT)
Message-ID: <20080528180701.CBC39108061@picon.linux-foundation.org>
References: <bug-7463-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-7463-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7463





------- Comment #19 from renatoyamane@mandic.com.br  2008-05-28 11:07 -------
I don't have any problem with Kernel available in Debian Lenny or other release
>=2.6.23.16

# hwinfo --bios
01: None 00.0: 10105 BIOS
  [Created at bios.174]
  Unique ID: rdCR.lZF+r4EgHp4
  Hardware Class: bios
  BIOS Keyboard LED Status:
    Scroll Lock: off
    Num Lock: off
    Caps Lock: off
  Base Memory: 639 kB
  PnP BIOS: SST2400
  BIOS: extended read supported
  BIOS32 Service Directory Entry: 0xea7c0
  SMBIOS Version: 2.3
  BIOS Info: #0
    Vendor: "TOSHIBA"
    Version: "Version 2.00"
    Date: "02/07/2006"
    Start Address: 0xeb000
    ROM Size: 512 kB
    Features: 0x02b3000000007f1a9f90
      ISA supported
      PCI supported
      PCMCIA supported
      PnP supported
      APM supported
      BIOS flashable
      BIOS shadowing allowed
      CD boot supported
      BIOS ROM socketed
      EDD spec supported
      1.2MB NEC 9800 Japanese Floppy supported
      720kB Floppy supported
      2.88MB Floppy supported
      Print Screen supported
      8042 Keyboard Services supported
      Serial Services supported
      Printer Services supported
      CGA/Mono Video supported
      ACPI supported
      USB Legacy supported
      LS-120 boot supported
      ATAPI ZIP boot supported
      Smart Battery supported
      F12 Network boot supported

In my case, this bug can be closed.

Best regards,
Renato S. Yamane


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
