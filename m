From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 4059] cpufreq longhaul for Via Nehemiah C (C5N) freezes whole
	system
Date: Wed, 9 Nov 2005 14:53:30 -0800
Message-ID: <200511092253.jA9MrUhA002184@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=4059





------- Additional Comments From ulrich@holeschak.de  2005-11-09 14:48 -------
I had the same problem. I only occurs if DMA is activated for IDE disk. I expect
that the systems dies when the DMA occurs while the systems is halted ...

In newer kernel versions (2.6.14) i new bug has been introduced:
The modification of the pci bus master mode prevents the 8139too network driver
from working. Removing the following lines in longhaul.c solves this problem
(but not the DMA crash!)

       /*
         * get current pci bus master state for all devices
         * and clear bus master bit
         */
        dev = NULL;
        i = 0;
        do {
                dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
                if (dev != NULL) {
                        pci_read_config_word(dev, PCI_COMMAND, &pci_cmd);
                        cmd_state[i++] = pci_cmd;
                        pci_cmd &= ~PCI_COMMAND_MASTER;
                        pci_write_config_word(dev, PCI_COMMAND, pci_cmd);
                }
        } while (dev != NULL);

...

        /* restore pci bus master state for all devices */
        dev = NULL;
        i = 0;
        do {
                dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
                if (dev != NULL) {
                        pci_cmd = cmd_state[i++];
                        pci_write_config_byte(dev, PCI_COMMAND, pci_cmd);
                }
        } while (dev != NULL);


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
