From: Thiago Guzella <thiago.guzella@gmail.com>
Subject: powernowk8 error on kernels later than 2.6.5 (long)
Date: Mon, 29 Nov 2004 18:13:57 -0200
Message-ID: <7608a89f04112912137882bc84@mail.gmail.com>
Reply-To: Thiago Guzella <thiago.guzella@gmail.com>
Mime-Version: 1.0
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi there,

As suggested by Dave Jones (davej@redhat.com) @ the Fedora mailing
list, I am reporting here an error I have encountered... I have an
Athlon64 box running Fedora 2 x86_64 (whose default kernel is 2.6.5).
The 2.6.5 version works perfectly... The problems start when running a
kernel later than 2.6.5 (I have tried with 2.6.6, 2.6.8 and 2.6.9). If
I select any of those kernels to boot, I get an error message "BIOS
Error: No PSB" during kernel initialization, but the start-up goes
on... When trying to start X, the system freezes (after a malformed
image is drawn on the screen)...

While running Fedora 2, I am actually able to get the system up @
runlevel 3, and, depending on the Cool and Quiet setting on the bios,
I get two different error messages:

SNIP:
---

- With Cool & Quiet DISABLED in bios:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8: BIOS error - no PSB

This is obvious, as Cool and Quiet is disabled, powernowk8 would not work...

- With Cool & Quiet ENABLED in bios:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x2 (1500 mV)
powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8: cpu_init done, current fid 0xe, vid 0x0
powernow-k8: ph2 null fid transition 0xe

Any clues in here?

---
 
Well, those results are with the 2.6.9 kernel from Fedora 2, @
runlevel 3. When I tried to update to Fedora 3 (which uses the 2.6.9
kernel as default), I was not able to boot @ runlevel 5 (with the same
strange image drawn on the screen), but neither @ runlevel 3 (i got a
kernel panic error, which I didn't give it enough time to analyse, as
I needed the machine working; I just ended up reinstalling fedora 2).

The thing is: on the same machine, if I boot with kernel 2.6.5, the
system works fine, but with 2.6.9, X won't start (the machine
freezes). Dave pointed out that this probably got fixed on 2.6.10rc1.
Can anyone confirm that? Will I be able to boot with kernel 2.6.10
(once it is released) ?

BTW: the machine is an Athlon64 3500, and the mobo is an Asus A8V
Deluxe Rev 2.0. LMK if more detailed specs are needed...

-- 
Thiago dos Santos Guzella
Electrical Enginnering Student - UFMG (www.ufmg.br), Brazil 
Linux User #354160
UIN: 13465286. Jabber: tguzella @ jabber.org

"Thou, nature, art my goddess; to thy laws my services are bound..." 
William Shakespeare
