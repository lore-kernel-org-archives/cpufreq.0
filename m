From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7859] Frequency can't switch on a dual Turion 64
Date: Tue, 23 Jan 2007 02:53:51 -0800
Message-ID: <200701231053.l0NArpnR031740@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7859

trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED



------- Additional Comments From trenn@suse.de  2007-01-23 02:45 -------
dmesg output (PPC - ppc: 0, cpuid 0, policy_cpu: 0 line)
ppc: 0
means you have to reach all freqs. Something is going wrong (or is this with 
the patch that makes all freqs reachable applied?).

The patch I pointed to was for a machine that wrongly returns ppc: 2 (in your 
case it should be 1) on startup.

> You are telling that my ACPI tables may be broken... Should I fix them?
Not sure, I am a bit confused now...
I expected a line like:
dmesg output (PPC - ppc: 1, cpuid 0, policy_cpu: 0 line)
In this case it is a BIOS problem (depends on how you read the specs, see the 
patch description from comment #6). The patch from comment #6 is the right fix 
and should find it's way mainline through Len, maybe it's worth also adding it 
to 2.6.19.3.
I assume that above line comes from the patched kernel, the patch from comment 
#6 gets mainline soon, everything is fine and I am closing this one now.

After digging a bit more... my patch from comment #5 should not be needed as 
CPU1's policy never gets used.

To verify you can add the printk that produced this line
dmesg output (PPC - ppc: 0, cpuid 0, policy_cpu: 0 line)
and make sure cpufreq is broken, there should be ppc: 1.

And/Or what would be really great: you can search BIOS configs for a 
Powermanagement/PowerNow! config to let the machine run on lower freq when 
working on battery if your BIOS provides that. Be sure also AC/battery module 
is loaded and unplug/replug AC adapter and verify that max freq gets lowered on 
battery and is increased again when working on AC. Reopen if you think 
something is still broken.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
