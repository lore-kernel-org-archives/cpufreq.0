From: Catalin Drula <catalin@cs.toronto.edu>
Subject: Dynamic-voltage scaling on PDAs (project)
Date: Tue, 7 Oct 2003 01:30:18 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0310070127350.22629@epoch.cs>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

my name is Catalin Drula and I am a Master's student in Computer Science
at the University of Toronto in Canada. I am doing a project with two
other classmates for our course "Mobile and Pervasive Computing". The
theme of this research project is quantifying the energy-savings of using
a scheduler with dynamic-voltage scaling support. We were planning to do
this on a PDA (handheld computer) by modifying the Linux kernel scheduler.

The problem we have run into thus far is that there do not seem to be PDAs
which support dynamic-voltage scaling. There are some that support
frequency scaling, but none of them seem to support dynamic-voltage
scaling. Since the whole purpose of our project was to be able to "show"
our results on a "real" platform we are currently in a dead-end.

Do you know of any PDAs/architectures which support dynamic-voltage
scaling?

From our investigations, only Transmeta's Crusoe and Intel's XScale
processors seem to have voltage scaling. However, we do not think that
there are any PDAs based on Crusoe. The XScale seems to need support from
the board for voltage-scaling, support which is probably lacking in PDAs.

Any tips/hints would be appreciated.

Thank you very much in advance for your time,

Catalin Drula
