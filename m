From: Jeff Hagen <jeff@hagen.org>
Subject: hid-core and cpufreq conflicts
Date: Sun, 16 May 2004 02:01:38 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200405160201.38892.jeff@hagen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: linux-usb-users@lists.sourceforge.net
Cc: cpufreq@www.linux.org.uk

Hello,

I am having an interesting conflict between USB and the CPUfreq driver for P4 
mobile in my laptop... (Compaq Evo N610c)

When I have both enabled, and the CPUfreq set to use the "userspace" governor, 
hid-core crashed with the following error every time I click the mouse buttom 
more than once in a second. (so double clicking is a pain) I have not had any 
other USB actions cause this crash, such as using my USB connected wireless 
card.

(from dmesg)
drivers/usb/input/hid-core.c: can't resubmit intr, 0000:02:0e.2-4.1/input0, 
status -32

After this error I have to rmmod ehci_hcd && service usb restart to make 
anything usb work again.

I have also noticed that the frequency of the processor will not scale below 
1196mhz (processor is a 2.0ghz P4 mobile) when ehci_hcd is loaded, but it 
will scale all the way down to 130mhz when this module is not loaded...

Any ideas on what may be causing the problems?

Thanks,
Jeff Hagen
jeff@hagen.org

Please CC me in any replies as I am not a member of the USB-users mailinglist.
