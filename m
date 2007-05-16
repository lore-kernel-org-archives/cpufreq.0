From: Matthieu CASTET <castet.matthieu@free.fr>
Subject: cpufreq throttling driver
Date: Wed, 16 May 2007 19:36:52 +0000 (UTC)
Message-ID: <loom.20070516T213237-839@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi,

I have a desktop cpu supporting only throttling (no C-state and no P-state
(acpi-cpufreq refuse to load)).

Does it make sense to use throttling to save some power ?


If yes why aren't there a cpufreq driver for managing throttling ?
That way governor could be used with throttling.

Does it make sense ?


Thanks

Matthieu
