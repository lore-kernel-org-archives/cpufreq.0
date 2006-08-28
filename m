From: Erich Boleyn <erich@uruk.org>
Subject: powersaved is backwards on my machine...
Date: Mon, 28 Aug 2006 09:45:48 -0700
Message-ID: <E1GHkFA-000420-0x@uruk.org>
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
To: cpufreq@lists.linux.org.uk


[just being clear, I am an AMD employee, though I am writing for
 myself at the moment]

Greetings,

Maybe this is a FAQ of some sort, but I couldn't find it with the
searches I tried, so I'm sending it here to know what the right thing
to do is...

I have an AMD machine which, when I enabled the powernow-k8 module and
powersaved, sets the power states opposite of what they should be.

I.e. when the machine is unloaded, it runs at the highest clock speed/
power state, and which the machine is loaded, it runs at the lowest
clock speed/power state.

I looked at the code a bit, and figured out the root causes:
  --  My old machine does not have correct ACPI power-state tables, so
	I disabled that.  (no, I can't get a BIOS update, sigh)
  --  It *does* have a functioning old Athlon64 PSB BIOS interface.
  --  powernow-k8 reports PSB-based power-states in ascending order
	instead of descending order like ACPI.
  --  powersaved assumes that the cpufreq interface will always
	report the power-states in descending order.

Fixing either cpufreq to report them always in descending order, or
powersaved to not assume it is in descending order is possebl...  but
the question is what the cpufreq interface *should* support.

So, I could not find any documentation on cpufreq that claimed the
frequency states listed should be in any particular order, but maybe
I was just not looking in the right place for the documentation...

--
    Erich Stefan Boleyn     <erich@uruk.org>     http://www.uruk.org/
"Reality is truly stranger than fiction; Probably why fiction is so popular"
